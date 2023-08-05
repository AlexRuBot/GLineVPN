//
//  RegistrationViewModel.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import Foundation
import FirebaseAuth

protocol RegistrationViewModelType: AnyObject {
    var appCoordinator: AppCoordinator? { get set }
    
    func singUp(email: String, password: String)

}

class RegistrationViewModel: RegistrationViewModelType {
    var appCoordinator: AppCoordinator?
    
    
    func singUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] data , error in
            if let error = error {
                print(error)
                self?.appCoordinator?.showAlert(title: "Error", message: error.localizedDescription)
                return
            }
            
            self?.appCoordinator?.goTo(.main)
        }
    }
}
