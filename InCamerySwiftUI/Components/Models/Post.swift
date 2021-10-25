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
    
    init?(dict: [String: AnyObject]) {
        
        guard let id = dict["id"] as? Int,
              let smallURL = dict["smallURL"] as? String,
              let fullURL = dict["fullURL"] as? String,
              let date = dict["date"] as? String,
              let userNick = dict["user_nick"] as? String else { return nil }

        self.id = id
        self.smallURL = smallURL
        self.fullURL = fullURL
        self.text = dict["text"] as? String
        self.date = date
        self.userID = (dict["user_id"] as? Int) ?? 0
        self.userNick = userNick
        self.userPhoto = dict["user_photo"] as? String
        self.likes = (dict["likes"] as? Int) ?? 0
        self.comments = (dict["comments"] as? Int) ?? 0
        
    }
    
}

extension Post: Equatable {
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
}
