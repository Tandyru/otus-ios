//
//  MyPeerIDProvider.swift
//  otus-ios-hw-9
//
//  Created by Andrey Tanakov on 16.03.2025.
//

import MultipeerConnectivity

final class MyPeerIDProvider {
    let myPeerId = MCPeerID(displayName: UIDevice.current.name)
}
