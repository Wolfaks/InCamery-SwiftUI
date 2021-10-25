//
//  FullPostView.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 23.10.2021.
//

import SwiftUI
import Combine

struct FullPostView: View {
    var postID: Int
    @State var post: Post?
    @State var cancellable = Set<AnyCancellable>()
    
    init(postID: Int) {
        self.postID = postID
        
        UINavigationBar.appearance().backgroundColor = Instruments.colorFromHex(AppTheme.Colors.primary)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            Rectangle()
            .foregroundColor(Instruments.colorFromHex(AppTheme.Colors.primary).toColor())
            .edgesIgnoringSafeArea(.top)
            .frame(height: 0)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    
                    if let fullURL = post?.fullURL {
                        let photoUrl = Constants.Urls.mediaLink + fullURL
                        ImageUrlView(url: photoUrl, width: UIScreen.main.bounds.width, height: nil)
                    }
                    
                    HStack(alignment: .center, spacing: 5) {
                        if let userPhoto = post?.userPhoto, !userPhoto.isEmpty {
                            let userPhotoUrl = Constants.Urls.mediaLink + userPhoto
                            ImageUrlView(url: userPhotoUrl, width: 32, height: 32)
                        }
                        
                        VStack(alignment: .leading, spacing: 1) {
                            Text(post?.userNick ?? "")
                                .foregroundColor(Instruments.colorFromHex(AppTheme.Colors.primary).toColor())
                            
                            Text(post?.date ?? "")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        
                        Image(systemName: "suit.heart")
                            .foregroundColor(Instruments.colorFromHex(AppTheme.Colors.lightGray).toColor())
                            .font(.system(size: 24))
                            .padding(.leading, 5)
                        
                        Text(post?.likes != nil ? "\(post!.likes)" : "0")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                        
                        Image(systemName: "message")
                            .foregroundColor(Instruments.colorFromHex(AppTheme.Colors.lightGray).toColor())
                            .font(.system(size: 22))
                            .padding(.leading, 10)
                        
                        Text(post?.comments != nil ? "\(post!.comments)" : "0")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 10)
                    
                    Divider()
                        .padding(.horizontal, 10)
                    
                    Text("\(post?.text ?? "")")
                        .font(.system(size: 15))
                        .padding(.horizontal, 10)
                }
            }
        }
        .background(Color.white)
        .navigationTitle("\(Constants.Strings.post) " + String(postID))
        .onAppear() {
            loadFullPost()
        }
    }
    
    func loadFullPost() {
        PostService().getFullPost(postID: postID)?
            .sink { data in
                guard let data = data as? Data else { return }
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let response = try FullPostResponse(json: json)
                    if response.error == 0 {
                        guard let post = response.post else { return }
                        DispatchQueue.main.async {
                            self.post = response.post
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            .store(in: &cancellable)
    }
}
