//
//  MainView.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        return button
    }()
    
    let statusVPNLable: UILabel = {
        let label = UILabel()
        label.text = "Status OFF"
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    let selectVPNButton: UIButton = {
        let button = UIButton()
        button.setTitle("Estonia", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let uploadView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 10
        return view
    }()
    
    let downloadView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 10
        return view
    }()
    
    let uploadLable: UILabel = {
        let label = UILabel()
        label.text = "Upload 0 Mb"
        return label
    }()
    
    let downloadLable: UILabel = {
        let label = UILabel()
        label.text = "Download 0 Mb"
        return label
    }()
    
    let timeLable: UILabel = {
        let label = UILabel()
        label.text = "00:00:00"
        return label
    }()
    
    let connectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Connect", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        self.addSubview(settingButton)
        self.addSubview(statusVPNLable)
        self.addSubview(selectVPNButton)
        self.addSubview(uploadView)
        self.addSubview(downloadView)
        self.addSubview(uploadLable)
        self.addSubview(downloadLable)
        self.addSubview(timeLable)
        self.addSubview(connectButton)
    }
    
    private func addConstraints() {
        settingButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        statusVPNLable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
        }
        
        selectVPNButton.snp.makeConstraints { make in
            make.top.equalTo(statusVPNLable.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        }
        
        uploadView.snp.makeConstraints { make in
            make.top.equalTo(selectVPNButton.snp.bottom).offset(20)
            make.left.equalTo(selectVPNButton.snp.left)
            make.right.equalTo(self.snp.centerX)
            make.height.equalTo(50)
        }
        
        downloadView.snp.makeConstraints { make in
            make.top.equalTo(uploadView.snp.bottom).offset(20)
            make.left.equalTo(selectVPNButton.snp.left)
            make.right.equalTo(self.snp.centerX)
            make.height.equalTo(50)
        }
        
        uploadLable.snp.makeConstraints { make in
            make.right.equalTo(selectVPNButton.snp.right)
            make.centerY.equalTo(uploadView.snp.centerY)
        }
        
        downloadLable.snp.makeConstraints { make in
            make.right.equalTo(selectVPNButton.snp.right)
            make.centerY.equalTo(downloadView.snp.centerY)
        }
        
        timeLable.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(downloadView.snp.bottom).offset(20)
        }
        
        connectButton.snp.makeConstraints { make in
            make.top.equalTo(timeLable.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        }
    }
}
