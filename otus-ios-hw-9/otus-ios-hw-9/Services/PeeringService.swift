//
//  PeeringServiceImpl.swift
//  otus-ios-hw-9
//
//  Created by Andrey Tanakov on 16.03.2025.
//

import Combine
import MultipeerConnectivity

final class PeeringService: NSObject {
    @Inject private var serviceTypeProvider: ServiceTypeProvider
    @Inject private var myPeerIDProvider: MyPeerIDProvider
    @Inject private var sessionService: SessionService
    
    private var serviceType: String {
        serviceTypeProvider.serviceType
    }
    private var myPeerId: MCPeerID {
        myPeerIDProvider.myPeerId
    }
    private var advertiser: MCNearbyServiceAdvertiser!
    private var subscriptions = Array<AnyCancellable>()

    override init() {
        super.init()
        
        advertiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: nil, serviceType: serviceType)
        advertiser.delegate = self

        sessionService.peerConnectionStateChanges.sink { [weak self] event in
            self?.onPeerConnectionStateChanged(peerID: event.peerID, state: event.state)
        }.store(in: &subscriptions)
        
        self.advertiser.startAdvertisingPeer()
    }
    
    deinit {
        advertiser.stopAdvertisingPeer()
    }

    func onPeerConnectionStateChanged(peerID: MCPeerID, state: MCSessionState) {
        DispatchQueue.main.async {
            switch state {
            case .connected:
                print("Connected to \(peerID.displayName)")
            case .connecting:
                print("Connecting to \(peerID.displayName)")
            case .notConnected:
                print("disconnected from \(peerID.displayName)")
            @unknown default:
                fatalError()
            }
        }
    }
}

extension PeeringService: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, sessionService.session)
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        print("Advertising failed: \(error.localizedDescription)")
    }
}
