//
//  MainPostCell.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 19.10.2021.
//

import SwiftUI
import Combine

struct MainPostCell: View {
    let post: Post
    
    var body: some View {
        
        let photoUrl = Constants.Urls.mediaLink + post.smallURL
        let width = (UIScreen.main.bounds.width / Constants.Settings.postsAtRow) + 2
        
        NavigationLink(destination: FullPostView(postID: post.id)) {
            ImageUrlView(url: photoUrl, width: width, height: width)
        }
    }
}
