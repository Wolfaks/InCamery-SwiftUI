//
//  PostService.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 24.09.2021.
//

import Foundation
import Combine

class PostService {
    
    enum links: String {
        case postList = "main.php"
        case fullPost = "post.php"
    }
    
    func getPostList(page: Int) -> AnyPublisher<Any, Never>? {

        // Парамс
        let params = ["page": "\(page)"]

        // Подготовка URL
        guard let urlWithParams = NSURLComponents(string: Constants.Urls.apiLink + links.postList.rawValue) else { return nil }

        // Параметры запроса
        var parameters = [URLQueryItem]()
        for (key, value) in params {
            parameters.append(URLQueryItem(name: key, value: value))
        }

        if !parameters.isEmpty {
            urlWithParams.queryItems = parameters
        }
        // END Параметры запроса
        
        if let url = urlWithParams.url {
            return Networking.shared.getData(url: url)
        } else {
            return nil
        }
        
    }
    
    func getFullPost(postID: Int) -> AnyPublisher<Any, Never>? {

        // Парамс
        let params = ["id": "\(postID)"]

        // Подготовка URL
        guard let urlWithParams = NSURLComponents(string: Constants.Urls.apiLink + links.fullPost.rawValue) else { return nil }

        // Параметры запроса
        var parameters = [URLQueryItem]()
        for (key, value) in params {
            parameters.append(URLQueryItem(name: key, value: value))
        }

        if !parameters.isEmpty {
            urlWithParams.queryItems = parameters
        }
        // END Параметры запроса
        
        if let url = urlWithParams.url {
            return Networking.shared.getData(url: url)
        } else {
            return nil
        }
        
    }
}
