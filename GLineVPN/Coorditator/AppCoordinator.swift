//
//  AppCoordinator.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import UIKit
import FirebaseAuth

protocol Coordinator {
    var navigationController : UINavigationController { get set }
    
    func start()
    func push(_ view: ViewsType)
    func back()
    func backToLogIn()
    
    func showAlert(title: String, message: String)
}


class AppCoordinator: Coordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func start() {
        let viewController = ControllerFactory.build(config: (.logIn, self))
        navigationController.setViewControllers([viewController], animated: true)
        if Auth.auth().currentUser != nil {
            push(.main)
        }
    }
    
    func push(_ view: ViewsType) {
        let viewController = ControllerFactory.build(config: (view, self))
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func present(_ view: ViewsType) {
        let viewController = ControllerFactory.build(config: (view, self))
        navigationController.present(viewController, animated: true)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        navigationController.present(alert, animated: true)
    }
    
    func backToLogIn() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            showAlert(title: "Error", message: signOutError.localizedDescription)
        }
    }

    
}
