//
//  Caching.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 19.10.2021.
//

import Foundation
import SwiftUI

class Caching {
    var cache = NSCache<NSString, UIImage>()
    private static var caching = Caching()
    
    static func getCaching() -> Caching {
        return caching
    }
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}
