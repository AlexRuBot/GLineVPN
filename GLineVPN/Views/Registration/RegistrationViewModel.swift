//
//  RegistrationViewModel.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import Foundation

protocol RegistrationViewModelType: AnyObject {
    var appCoordinator: AppCoordinator? { get set }
}

class RegistrationViewModel: RegistrationViewModelType {
    var appCoordinator: AppCoordinator?
    
}
