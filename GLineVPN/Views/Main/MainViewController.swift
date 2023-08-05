//
//  MainViewController.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    
    var viewModel: MainViewModelType?
    var baseView: MainView = MainView()
    var user: User? = Auth.auth().currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        baseView.logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        if let user = user {
            title = user.email
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
        view.addSubview(baseView)
    }
    
    @objc private func logOut() {
        viewModel?.logOut()
    }
}

