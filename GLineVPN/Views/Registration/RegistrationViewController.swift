//
//  RegistrationViewController.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import UIKit


class RegistrationViewController: UIViewController {
    
    private let baseView = RegistrationView()
    var viewModel: RegistrationViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.backgroundColor = .systemBackground
        baseView.emailTextField.delegate = self
        baseView.passwordTextField.delegate = self
        baseView.sindUpButton.addTarget(self, action: #selector(sindUp), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
        view.addSubview(baseView)
    }
    
    
    @objc private func sindUp() {
        guard let email = baseView.emailTextField.text,
              let password = baseView.passwordTextField.text else { return }
        
        viewModel?.singUp(email: email, password: password)
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
