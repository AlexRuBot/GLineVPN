//
//  SettingViewController.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import UIKit

class SettingViewController: UIViewController {
    
    var viewModel: SettingViewModelProtocol?
    var baseView: SettingView = SettingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let barButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.forward"), style: .done, target: self, action: #selector(logOut))
        navigationItem.rightBarButtonItem = barButton
        navigationController?.navigationBar.isHidden = false
        title = "Settings"
    }
    
    @objc private func logOut() {
        viewModel?.logOut()
    }
}
