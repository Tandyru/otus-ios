//
//  NetworkMonitor.swift
//  ServiceCityListProvider
//
//  Created by Andrey Tanakov on 23.03.2025.
//

import Combine
import Network

final class NetworkMonitor: @unchecked Sendable {
    @Published private(set) var isConnected: Bool = false
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        startMonitoring()
    }
        
    deinit {
        monitor.cancel()
    }
    
    func checkConnection() async -> Bool {
        await withCheckedContinuation { continuation in
            DispatchQueue.main.async {
                continuation.resume(returning: self.isConnected)
            }
        }
    }
    
    private func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}
