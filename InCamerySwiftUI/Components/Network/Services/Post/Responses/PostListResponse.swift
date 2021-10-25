//
//  PostListResponse.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 24.09.2021.
//

import Foundation

struct PostListResponse {
    
    var posts: [Post] = []
    var error: Int = 0
    var message: String = ""
    var haveNextPage: Bool = false

    init(json: Any) {
        
        // Обрабатываем полученные данные списка
        guard let arrayJson = json as? [String: AnyObject], let error = arrayJson["error"] as? Int else { return }
        self.error = error
        message = (arrayJson["message"] as? String) ?? ""
        haveNextPage = (arrayJson["haveNextPage"] as? Bool) ?? false
        
        // Обработка записей
        if error == 0, let postsArray = arrayJson["posts"] as? [[String: AnyObject]], !postsArray.isEmpty {
            var posts: [Post] = []
            for postDict in postsArray {
                guard let post = Post(dict: postDict) else { continue }
                posts.append(post)
            }
            self.posts = posts
        }
        
    }
    
}
