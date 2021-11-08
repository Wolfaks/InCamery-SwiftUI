//
//  ApiResponse.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 08.11.2021.
//

import Foundation

protocol ApiResponse {
    var error: Int { get }
    var message: String { get }
    mutating func decodeJson(json: String)
}
