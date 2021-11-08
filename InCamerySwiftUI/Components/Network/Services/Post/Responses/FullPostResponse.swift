//
//  FullPostResponse.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 24.09.2021.
//

import Foundation

struct FullPostResponse: Decodable, ApiResponse {
    
    var post: Post?
    var error: Int = -1
    var message: String = ""
    
    mutating func decodeJson(json: String) {
        
        // Обрабатываем полученные данные
        guard !json.isEmpty else { return }
        
        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let responseDecode = try decoder.decode(FullPostResponse.self, from: jsonData)
            self.post = responseDecode.post
            self.error = responseDecode.error
            self.message = responseDecode.message
        } catch {
            //print(error)
        }
        
    }
    
}
