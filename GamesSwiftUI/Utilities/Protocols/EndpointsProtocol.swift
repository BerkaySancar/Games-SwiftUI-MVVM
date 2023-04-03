//
//  EndpointsProtocol.swift
//  GamesSwiftUI
//
//  Created by Berkay Sancar on 3.04.2023.
//

import Foundation

protocol EndpointsProtocol {
    var baseURLString: String { get }
    var apiKey: String { get }
}

extension EndpointsProtocol {
    var url: String {
        return baseURLString + apiKey
    }
}
