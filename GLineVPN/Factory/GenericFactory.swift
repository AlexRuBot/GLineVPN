//
//  GenericFactory.swift
//  GLineVPN
//
//  Created by Александр Гужавин on 03.08.2023.
//

import Foundation

protocol GenericFactory {
    associatedtype Input
    associatedtype Output
    static func build(config: Input) -> Output
}
