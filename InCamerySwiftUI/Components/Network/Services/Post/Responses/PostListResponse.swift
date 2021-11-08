//
//  PostListResponse.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 24.09.2021.
//

import Foundation

struct PostListResponse: Decodable, ApiResponse {
    
    var posts: [Post] = []
    var error: Int = -1
    var message: String = ""
    var haveNextPage: Bool = false
    
    mutating func decodeJson(json: String) {
        
        // Обрабатываем полученные данные
        guard !json.isEmpty else { return }
        
        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let responseDecode = try decoder.decode(PostListResponse.self, from: jsonData)
            self.posts = responseDecode.posts
            self.error = responseDecode.error
            self.message = responseDecode.message
            self.haveNextPage = responseDecode.haveNextPage
        } catch {
            //print(error)
        }
        
    }
    
}
