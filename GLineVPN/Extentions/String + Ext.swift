//
//  String + Ext.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 05.08.2023.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

       let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       return emailPred.evaluate(with: self)
   }
}
