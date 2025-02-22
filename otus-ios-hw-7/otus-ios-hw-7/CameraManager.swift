//
//  CameraManager.swift
//  otus-ios-hw-7
//
//  Created by Andrey Tanakov on 16.02.2025.
//

import AVFoundation
import Vision
import CoreML
import SwiftUI

class CameraManager: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    @Published var cameraImage: UIImage? = nil
    @Published var objectsWithBoxes: [(label: String, confidence: Float, bounds: CGRect)] = []
    
    private let session = AVCaptureSession()
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    private var mlModel: VNCoreMLModel?

    override init() {
        super.init()
        
        loadMLModel()
        
        NotificationCenter.default.addObserver(self, selector: #selector(deviceOrientationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)

        configureCamera()
    }
    
    func configureCamera() {
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else { return }
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            if session.canAddInput(input) {
                session.addInput(input)
            }
            
            let videoOutput = AVCaptureVideoDataOutput()
            videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
            
            if session.canAddOutput(videoOutput) {
                session.addOutput(videoOutput)
            }
            
            DispatchQueue.global(qos: .background).async {
                self.session.startRunning()
            }
        } catch {
            print("Ошибка при добавлении входного устройства: \(error)")
        }
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        let deviceOrientation = getDeviceOrientation()
        
        let ciImage = CIImage(cvPixelBuffer: imageBuffer)
        let transform = getTransform(for: deviceOrientation)
        let orientedImage = ciImage.transformed(by: transform)

        let context = CIContext()
        guard let cgImage = context.createCGImage(orientedImage, from: orientedImage.extent) else { return }
        let uiImage = UIImage(cgImage: cgImage)
        
        detectObjects(in: orientedImage)
        
        DispatchQueue.main.async {
            self.cameraImage = uiImage
        }
    }
    
    func stopSession() {
        DispatchQueue.global(qos: .background).async {
            self.session.stopRunning()
        }
    }
    
    @objc func deviceOrientationDidChange() {
        DispatchQueue.main.async {
            self.objectWillChange.send()
        }
    }
    
    func detectObjects(in image: CIImage) {
        guard let model = mlModel else {
            print("Модель не загружена")
            return
        }
        
        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
            guard let results = request.results as? [VNRecognizedObjectObservation], error == nil else {
                print("Ошибка обработки изображения: \(error?.localizedDescription ?? "Неизвестная ошибка")")
                return
            }
            self?.processRecognitionResults(results)
        }
        
        let targetEdgeSize: CGFloat = 640 // сеть обучалась на изображениях размером 640x640
        let targetSize = CGSize(width: targetEdgeSize, height: targetEdgeSize)
        let resizedImage = resizeImageWithPadding(image, toSize: targetSize)
        
        let handler = VNImageRequestHandler(ciImage: resizedImage)
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                print("Ошибка выполнения Vision запроса: \(error)")
            }
        }
    }
    
    private func processRecognitionResults(_ results: [VNRecognizedObjectObservation]) {
        var detectedObjectsWithBoxes: [(label: String, confidence: Float, bounds: CGRect)] = []

        for observation in results {
            if let label = observation.labels.first {
                let boundingBox = convertBoundingBox(toScreenCoordinates: observation.boundingBox)
                detectedObjectsWithBoxes.append((label: label.identifier, confidence: label.confidence, bounds: boundingBox))
            }
        }
        
        DispatchQueue.main.async {
            self.objectsWithBoxes = detectedObjectsWithBoxes
        }
    }
    
    private func convertBoundingBox(toScreenCoordinates boundingBox: CGRect) -> CGRect {
        let screenSize = UIScreen.main.bounds.size
        let hMultiplier = screenSize.height > screenSize.width ? screenSize.height / screenSize.width : 1.0
        let vMultiplier = screenSize.width > screenSize.height ? screenSize.width / screenSize.height : 1.0
        let x = screenSize.width * boundingBox.origin.x * hMultiplier // screenSize.width * (1 - boundingBox.origin.x - boundingBox.size.width)
        let y = screenSize.height * (1 - boundingBox.origin.y - boundingBox.size.height) * vMultiplier
        let width = screenSize.width * boundingBox.size.width * hMultiplier
        let height = screenSize.height * boundingBox.size.height * vMultiplier
        
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    private func loadMLModel() {
        do {
            mlModel = try VNCoreMLModel(for: PhoneDetector_1_Iteration_12000().model)
            print("Модель успешно загружена")
        } catch {
            print("Ошибка загрузки ML-модели: \(error.localizedDescription)")
        }
    }
}

func getDeviceOrientation() -> UIImage.Orientation {
    switch UIDevice.current.orientation {
    case .portrait:
        return .up
    case .landscapeRight:
        return .right
    case .landscapeLeft:
        return .left
    case .portraitUpsideDown:
        return .down
    default:
        return .up
    }
}

func getTransform(for orientation: UIImage.Orientation) -> CGAffineTransform {
    var transform = CGAffineTransform.identity
    
    switch orientation {
    case .up:
        transform = CGAffineTransform(rotationAngle: -.pi / 2)
    case .left:
        transform = CGAffineTransform.identity
    case .right:
        transform = CGAffineTransform(rotationAngle: .pi)
    case .down:
        transform = CGAffineTransform(rotationAngle: -.pi / 2)
    default:
        break
    }
    
    return transform
}

func resizeImageWithPadding(_ image: CIImage, toSize targetSize: CGSize) -> CIImage {
    let origin = image.extent.origin
    let movedImage = image.transformed(by: CGAffineTransform(translationX: -origin.x, y: -origin.y))
    
    let imageSize = movedImage.extent.size
    guard imageSize.width > 0, imageSize.height > 0 else {
        return image
    }
    
    let widthRatio = targetSize.width / imageSize.width
    let heightRatio = targetSize.height / imageSize.height
    let scale = min(widthRatio, heightRatio)
    
    guard let resizedImage = CIFilter(name: "CILanczosScaleTransform", parameters: [
        kCIInputImageKey: movedImage,
        kCIInputScaleKey: scale,
        kCIInputAspectRatioKey: 1.0
    ])?.outputImage else {
        return movedImage
    }
    
    let scaledWidth = imageSize.width * scale
    let scaledHeight = imageSize.height * scale
    
    let grayColor = CIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
    guard let background = CIFilter(name: "CIConstantColorGenerator", parameters: [kCIInputColorKey: grayColor])?
        .outputImage?
        .cropped(to: CGRect(origin: .zero, size: targetSize)) else {
        return resizedImage
    }
    
    let dx: CGFloat = 0
    let dy: CGFloat = (targetSize.height - scaledHeight)
    let centeredImage = resizedImage.transformed(by: CGAffineTransform(translationX: dx, y: dy))
    
    guard let finalImage = CIFilter(name: "CISourceOverCompositing", parameters: [
        kCIInputImageKey: centeredImage,
        kCIInputBackgroundImageKey: background
    ])?.outputImage else {
        return centeredImage
    }
    
    return finalImage
}

