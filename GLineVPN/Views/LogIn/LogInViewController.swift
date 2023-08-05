//
//  LogInViewController.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    var logInView: LogInView = LogInView()
    var viewModel: LogInViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        logInView.emailTextField.delegate = self
        logInView.passwordTextField.delegate = self
        logInView.logInButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        logInView.sindUpButton.addTarget(self, action: #selector(sindUp), for: .touchUpInside)
        logInView.reserPasswordButton.addTarget(self, action: #selector(resetPassword), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logInView.emailTextField.text = ""
        logInView.passwordTextField.text = ""
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        logInView.frame = view.bounds
        view.addSubview(logInView)
    }
    
    
    @objc private func logIn() {
        guard let email = logInView.emailTextField.text,
              let password = logInView.passwordTextField.text else { return }
        
        logInView.logInButton.isEnabled = false
        
        viewModel?.logIn(email: email, password: password) { [weak self] in
            self?.logInView.logInButton.isEnabled = true
        }
    }
    
    @objc private func sindUp() {
        viewModel?.sindUp()
    }
    
    @objc private func resetPassword() {
        guard let email = logInView.emailTextField.text else { return }
        
        viewModel?.resetPassword(email: email)
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
