//
//  RegistrationViewController.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import UIKit


class RegistrationViewController: UIViewController {
    
    private let registrationView = RegistrationView()
    var viewModel: RegistrationViewModelType?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        sleep(2)
        viewModel?.appCoordinator?.goTo(.logIn)
    }
}
