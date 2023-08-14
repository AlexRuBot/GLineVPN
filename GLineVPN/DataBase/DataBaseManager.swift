//
//  DataBaseManager.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 05.08.2023.
//

import Foundation

enum Cuntry: String {
    case estonia = "estonia"
    case usa = "usa"
    case germany = "germany"
    case russia = "russia"
}

struct VPN {
    var cuntry: Cuntry
    var username: String
    var passwordReference: String
    var serverAddress: String
    var sharedSecretReference: String
}


class DataBaseManager {
    
    static let shared = DataBaseManager()
    
    
    var selectedVPN: Observable<VPN>?
    
    
    private let vpnList = [
        VPN(cuntry: .estonia, username: "vpn.estonia", passwordReference: "vpn.estonia", serverAddress: "vpn.estonia", sharedSecretReference: "vpn.estonia"),
        VPN(cuntry: .usa, username: "vpn.usa", passwordReference: "vpn.usa", serverAddress: "vpn.usa", sharedSecretReference: "vpn.usa"),
        VPN(cuntry: .germany, username: "vpn.germany", passwordReference: "vpn.germany", serverAddress: "vpn.germany", sharedSecretReference: "vpn.germany"),
        VPN(cuntry: .russia, username: "vpn.russia", passwordReference: "vpn.russia", serverAddress: "vpn.russia", sharedSecretReference: "vpn.russia")
    ]
    
    func select(_ cuntry: Cuntry) {
        selectedVPN?.value = vpnList.first { $0.cuntry == cuntry }!
    }
    
}
