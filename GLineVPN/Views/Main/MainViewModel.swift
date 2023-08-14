//
//  MainViewModel.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import Foundation
import FirebaseAuth
import NetworkExtension

protocol MainViewModelType: AnyObject {
    var statusConnect: Observable<String>? { get set }
    var timerConnect: Observable<String>? { get set }
    var uploadSpeed: Observable<String>? { get set }
    var downloadSpeed: Observable<String>? { get set }

    func goToSetting()
    func goToSelectVPN()
    func connect()
    
}

class MainViewModel: MainViewModelType {
    var appCoordinator: AppCoordinator?
    
    var statusConnect: Observable<String>? = Observable("Off")
    var timerConnect: Observable<String>? = Observable("00:00:00")
    
    var uploadSpeed: Observable<String>? = Observable("0")
    var downloadSpeed: Observable<String>? = Observable("0")
    
    private var isStart: Bool = false
    private var timer: Timer?
    private var totalTime: Int = 0 {
        didSet {
            timerConnect?.value = convertTime(time: totalTime)
        }
    }
    private var keycheinUid: String? {
        get{
            Auth.auth().currentUser?.uid
        }
    }
    private let vpnManager = VPNManager.shared
    
    
    
    
    func goToSetting() {
        appCoordinator?.push(.setting)
    }
    
    func goToSelectVPN() {
        appCoordinator?.present(.chooseLocation)
    }
    
    
    func connect() {
        if isStart {
            stopTimer()
        } else {
            startTimer()
        }
        isStart.toggle()
    }
    
    
    
    private func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
                self?.totalTime += 1
            }
        startVPN()
    }
    
    private func stopTimer() {
            timer?.invalidate()
            totalTime = 0
        vpnManager.disconnect()
    }
    
    private func convertTime(time: Int) -> String {
        let hours = time / 3600
        let minutes = (time % 3600) / 60
        let seconds = (time % 3600) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    
    private func startVPN() {
        vpnManager.connectIPSec(config: Configuration(server: "gr4.vpnjantit.com",
                                                      account: "alexrubot-vpnjantit.com",
                                                      password: "test123344",
                                                      psk: "vpn")) { error in
            self.appCoordinator?.showAlert(title: "Error", message: error)
        }
    }

}
