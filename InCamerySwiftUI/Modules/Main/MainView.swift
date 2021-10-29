//
//  ContentView.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 23.09.2021.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HeaderView()
                MainPostScroll()
            }
            .accentColor(Instruments.colorFromHex(AppTheme.Colors.primary).toColor())
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
