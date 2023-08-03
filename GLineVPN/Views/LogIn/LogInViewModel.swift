//
//  LogInViewModel.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import Foundation

protocol LogInViewModelType: AnyObject {
    var appCoordinator: AppCoordinator? { get set }
}

class LogInViewModel: LogInViewModelType {
    var appCoordinator: AppCoordinator?
}
