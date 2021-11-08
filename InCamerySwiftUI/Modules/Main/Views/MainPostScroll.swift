//
//  MainViewModel.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 19.10.2021.
//

import Foundation
import SwiftUI
import Combine

struct MainPostScroll: View {
    @State var posts: [Post] = []
    @State var page = 1
    @State var haveNextPage = false
    
    @State var cancellable = Set<AnyCancellable>()
    
    private var gridItemLayout =
    [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 1) {
                ForEach(posts, id: \.id) { post in
                    MainPostCell(post: post)
                        .onAppear() {
                            if posts.last == post {
                                loadMore()
                            }
                        }
                }
            }
        }
        .background(Color.white)
        .onAppear() {
            loadPosts()
        }
    }
    
    private func loadPosts() {
        haveNextPage = false
        
        PostService().getPostList(page: page)?
            .sink { data in
                guard let data = data as? Data else { return }
                do {
                    
                    if let result = String(data: data, encoding: .utf8) {
                        var postListResponse = PostListResponse()
                        postListResponse.decodeJson(json: result)
                        if postListResponse.error == 0 {
                            DispatchQueue.main.async {
                                if self.page == 1 {
                                    self.posts = postListResponse.posts
                                } else {
                                    self.posts.append(contentsOf: postListResponse.posts)
                                }
                                self.haveNextPage = postListResponse.haveNextPage
                            }
                        }
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
            .store(in: &cancellable)
    }
    
    private func loadMore() {
        if haveNextPage {
            page += 1
            loadPosts()
        }
    }
}
