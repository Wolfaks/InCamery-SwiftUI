//
//  Post.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 23.09.2021.
//

import Foundation

struct Post: Decodable, Identifiable {
    
    var id: Int
    var smallURL: String
    var fullURL: String
    var text: String?
    var date: String
    var userID: Int?
    var userNick: String
    var userPhoto: String?
    var likes: Int
    var comments: Int
    
}

extension Post: Equatable {
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
}
