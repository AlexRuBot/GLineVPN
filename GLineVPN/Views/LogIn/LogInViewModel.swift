//
//  LogInViewModel.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import Foundation
import FirebaseAuth

protocol LogInViewModelType: AnyObject {    
    func logIn(email: String, password: String, completion: @escaping () -> Void)
    func sindUp()
    func resetPassword(email: String)
}

class LogInViewModel: LogInViewModelType {
    var appCoordinator: AppCoordinator?
    
    
    
    func logIn(email: String, password: String, completion: @escaping () -> Void) {
        guard email.isValidEmail() else {
            appCoordinator?.showAlert(title: "Error", message: "Invalid email")
            return completion()
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] data , error in
            if let error = error {
                print(error)
                self?.appCoordinator?.showAlert(title: "Error", message: error.localizedDescription)
                return completion()
            }
            
            self?.appCoordinator?.push(.main)
        }
        
    }
    
    func sindUp() {
        appCoordinator?.push(.registration)
    }
    
    func resetPassword(email: String) {
        guard email.isValidEmail() else {
            appCoordinator?.showAlert(title: "Error", message: "Invalid email")
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
            if let error = error {
                self?.appCoordinator?.showAlert(title: "Error", message: error.localizedDescription)
            } else {
                self?.appCoordinator?.showAlert(title: "Success", message: "Check your email")
            }
        }
        
    }
}
