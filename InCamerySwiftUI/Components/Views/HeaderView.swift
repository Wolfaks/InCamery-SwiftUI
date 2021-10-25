//
//  HeaderView.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 23.10.2021.
//

import SwiftUI
import WebKit

struct HeaderView: View {
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Instruments.colorFromHex(AppTheme.Colors.primary).toColor())
                .edgesIgnoringSafeArea(.top)
                .frame(height: 0)
            
            HStack(alignment: .center, spacing: 0) {
                Spacer()
                Image("logo")
                Spacer()
            }
            Spacer()
                .frame(height: 6)
        }
        .background(Instruments.colorFromHex(AppTheme.Colors.primary).toColor())
    }
    
}
