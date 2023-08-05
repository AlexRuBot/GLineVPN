//
//  MainView.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    let logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log Out", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(logOutButton)
        
        logOutButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
}
