//
//  ContentView.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 23.09.2021.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            NavigationView {
                VStack(spacing: 0) {
                    HeaderView()
                    MainPostScroll()
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            }
            .tabItem {
                Image(systemName: "square.grid.4x3.fill")
                Text(Constants.Strings.mainTabFeed)
            }
            
            VStack {
                Rectangle()
                    .foregroundColor(Instruments.colorFromHex(AppTheme.Colors.primary).toColor())
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 0)
                
                WebView(url: Constants.Urls.signinLink)
            }
            .background(Instruments.colorFromHex(AppTheme.Colors.primary).toColor())
            .tabItem {
                Image(systemName: "network")
                Text(Constants.Strings.mainTabWeb)
            }
        }
        .accentColor(Instruments.colorFromHex(AppTheme.Colors.primary).toColor())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
