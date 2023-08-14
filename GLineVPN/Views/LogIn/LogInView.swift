//
//  LogInView.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import UIKit
import SnapKit

class LogInView: UIView {
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textContentType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.backgroundColor = UIColor(hexString: "#007AFF")
        textField.textColor = UIColor(hexString: "#000000")
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textContentType = .password
        return textField
    }()

    let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let sindUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let reserPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset password", for: .normal)
        button.backgroundColor = .systemBackground
        button.setTitleColor(.systemGray2, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .white
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        self.addSubview(logInButton)
        self.addSubview(sindUpButton)
        self.addSubview(reserPasswordButton)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
    }
    
    private func addConstraints() {
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.top.equalToSuperview().offset(100)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
        }
        
        logInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(passwordTextField.snp.bottom).offset(32)
        }
        
        sindUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(logInButton.snp.bottom).offset(16)
        }
        
        reserPasswordButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(sindUpButton.snp.bottom).offset(16)
        }
    }
}
