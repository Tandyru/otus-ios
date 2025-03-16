//
//  SessionService.swift
//  otus-ios-hw-9
//
//  Created by Andrey Tanakov on 16.03.2025.
//

import Combine
import MultipeerConnectivity

final class SessionService: NSObject {
    struct PeerConnectionStateChangedEvent {
        let peerID: MCPeerID
        let state: MCSessionState
    }
    
    private(set) var session: MCSession!
    var peerConnectionStateChanges: AnyPublisher<PeerConnectionStateChangedEvent, Never> {
        peerConnectionStateChangesSubject.eraseToAnyPublisher()
    }
    var receivingData: AnyPublisher<Data, Never> {
        receivingDataSubject.eraseToAnyPublisher()
    }
        
    @Inject private var myPeerIDProvider: MyPeerIDProvider
    
    private let peerConnectionStateChangesSubject = PassthroughSubject<PeerConnectionStateChangedEvent, Never>()
    private let receivingDataSubject = PassthroughSubject<Data, Never>()

    override init() {
        super.init()
        session = MCSession(peer: myPeerIDProvider.myPeerId, securityIdentity: nil, encryptionPreference: .none)
        session.delegate = self
    }
    
    func send(data: Data) throws {
        try session.send(data, toPeers: session.connectedPeers, with: .reliable)
    }
}

extension SessionService: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        print("connectedPeers: \(session.connectedPeers)")
        peerConnectionStateChangesSubject.send(.init(peerID: peerID, state: state))
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        DispatchQueue.main.async {
            self.receivingDataSubject.send(data)
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {}
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {}
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {}
}
