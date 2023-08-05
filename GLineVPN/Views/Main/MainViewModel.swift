//
//  MainViewModel.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import Foundation
import FirebaseAuth

protocol MainViewModelType: AnyObject {
    var appCoordinator: AppCoordinator? { get set }

    func logOut()
}

class MainViewModel: MainViewModelType {
    var appCoordinator: AppCoordinator?

    func logOut() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            appCoordinator?.backToLogIn()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
