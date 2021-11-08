//
//  ComplaintResponse.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 24.09.2021.
//

import Foundation

struct ComplaintResponse: Decodable, ApiResponse {
    
    var error: Int = -1
    var message: String = ""
    
    mutating func decodeJson(json: String) {
        
        // Обрабатываем полученные данные
        guard !json.isEmpty else { return }
        
        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        
        do {
            let responseDecode = try decoder.decode(ComplaintResponse.self, from: jsonData)
            self.error = responseDecode.error
            self.message = responseDecode.message
        } catch {
            //print(error)
        }
        
    }
    
}
