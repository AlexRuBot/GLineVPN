//
//  Observable.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 05.08.2023.
//

import Foundation

class Observable<T> {
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping (T) -> Void) {
        self.listener = listener
    }
}


