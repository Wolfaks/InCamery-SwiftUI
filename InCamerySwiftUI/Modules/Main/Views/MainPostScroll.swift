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
    
    func loadPosts() {
        haveNextPage = false
        
        PostService().getPostList(page: page)?
            .sink { data in
                guard let data = data as? Data else { return }
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let response = try PostListResponse(json: json)
                    if response.error == 0 {
                        DispatchQueue.main.async {
                            if self.page == 1 {
                                self.posts = response.posts
                            } else {
                                self.posts.append(contentsOf: response.posts)
                            }
                            self.haveNextPage = response.haveNextPage
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            .store(in: &cancellable)
    }
    
    func loadMore() {
        if haveNextPage {
            page += 1
            loadPosts()
        }
    }
}
