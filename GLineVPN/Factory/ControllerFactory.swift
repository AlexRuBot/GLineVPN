//
//  ControllerFactory.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import UIKit

enum ViewsType {
    case main
    case logIn
    case registration
    case setting
    case chooseLocation
}

struct ControllerFactory: GenericFactory {
    static func build(config:(view: ViewsType, coordinator: AppCoordinator)) -> UIViewController {
        switch config.view {
        case .main:
            let mainVC = MainViewController()
            let mainVM = MainViewModel()
            mainVM.appCoordinator = config.coordinator
            mainVC.viewModel = mainVM
            return mainVC
            
        case .logIn:
            let logInVC = LogInViewController()
            let logInVM = LogInViewModel()
            logInVM.appCoordinator = config.coordinator
            logInVC.viewModel = logInVM
            return logInVC
            
        case .registration:
            let registrationVC = RegistrationViewController()
            let registrationVM = RegistrationViewModel()
            registrationVM.appCoordinator = config.coordinator
            registrationVC.viewModel = registrationVM
            return registrationVC
            
        case .setting:
            let settingVC = SettingViewController()
//            let settingVM = RegistrationViewModel()
//            settingVM.appCoordinator = config.coordinator
//            settingVC.viewModel = settingVM
            return settingVC
            
        case .chooseLocation:
            let chooseLocationVC = ChooseLocationViewController()
//            let chooseLocationVM = RegistrationViewModel()
//            registrationVM.appCoordinator = config.coordinator
//            registrationVC.viewModel = registrationVM
            return chooseLocationVC
        }
    }
}
