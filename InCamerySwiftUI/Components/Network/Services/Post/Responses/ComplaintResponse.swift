//
//  ComplaintResponse.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 24.09.2021.
//

import Foundation

struct ComplaintResponse {
    
    var error: Int = 0
    var message: String = ""

    init(json: Any) {
        
        // Обрабатываем полученные данные списка
        guard let arrayJson = json as? [String: AnyObject], let error = arrayJson["error"] as? Int else { return }
        self.error = error
        message = (arrayJson["message"] as? String) ?? ""
        
    }
    
}
