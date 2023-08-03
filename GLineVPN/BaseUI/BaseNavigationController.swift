//
//  BaseNavigationController.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import UIKit
import SnapKit

class BaseNavigationController: UINavigationController {
    
    override func loadView() {
        super.loadView()
        self.navigationBar.isHidden = true
    }
    
    
}
    
