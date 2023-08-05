//
//  SettingViewModel.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import Foundation

protocol SettingViewModelProtocol {
    func logOut()
}

class SettingViewModel: SettingViewModelProtocol {
    var appCoordinator: AppCoordinator?
    
    func logOut() {
        appCoordinator?.backToLogIn()
    }
}
