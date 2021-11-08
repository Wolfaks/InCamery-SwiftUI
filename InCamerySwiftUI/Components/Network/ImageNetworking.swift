//
//  ImageNetworking.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 24.09.2021.
//

import Foundation
import UIKit

class ImageNetworking: ObservableObject {
    @Published var image: UIImage = UIImage()
    var imageCaching = Caching.getCaching()
    var url: String
    
    init(url: String) {
        self.url = url
        loadImage()
    }
    
    private func loadImage() {
        guard !loadFromCache() else { return }
        loadFromUrl()
    }
    
    private func loadFromCache() -> Bool {
        guard let cacheImage = imageCaching.get(forKey: url) else {
            return false
        }
        
        image = cacheImage
        return true
    }
    
    private func loadFromUrl() {
        guard let url = URL(string: url) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
}
