//
//  Networking.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 23.09.2021.
//

import Foundation
import Combine

class Networking {

    enum HTTPError: LocalizedError {
        case statusCode
        case post
    }

    private init() {}
    static let shared = Networking()

    public func getData(url: URL) -> AnyPublisher<Any, Never> {

        let session = URLSession.shared

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        // Выполняем запрос по URL
        return session.dataTaskPublisher(for: urlRequest)
                .map { $0.data }
                .replaceError(with: false)
                .eraseToAnyPublisher()

    }

}
