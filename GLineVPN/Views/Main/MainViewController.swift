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
        view.backgroundColor = .systemBackground
        baseView.connectButton.addTarget(self, action: #selector(connect), for: .touchUpInside)
        baseView.selectVPNButton.addTarget(self, action: #selector(selectVPN), for: .touchUpInside)
        baseView.settingButton.addTarget(self, action: #selector(goToSetting), for: .touchUpInside)
        bind()
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
    
    
    @objc private func connect() {
        viewModel?.connect()
    }
    
    @objc private func selectVPN() {
        viewModel?.goToSelectVPN()
    }
    
    @objc private func goToSetting() {
        viewModel?.goToSetting()
    }
    
    private func bind() {
        viewModel?.timerConnect?.bind({[weak self] time in
            
            DispatchQueue.main.async {
                self?.baseView.timeLable.text = time
            }
        })
    }
    
}

