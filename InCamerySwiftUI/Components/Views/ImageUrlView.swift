//
//  ImageUrlView.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 19.10.2021.
//

import SwiftUI

struct ImageUrlView: View {
    @ObservedObject var imageNetworking: ImageNetworking
    var width: CGFloat
    var height: CGFloat?
    
    init(url: String, width: CGFloat, height: CGFloat?) {
        imageNetworking = ImageNetworking(url: url)
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Image(uiImage: imageNetworking.image)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
    }
}
