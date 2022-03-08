//
//  ContentView.swift
//  Pictopia
//
//  Created by Antonio Braccolino on 13/02/22.
//

import SwiftUI

struct ContentView: View {
    
    
    let text:LocalizedStringKey = "Discover"
    let text2:LocalizedStringKey = "Search"
    let text3:LocalizedStringKey = "Profile"
    
    
    var body: some View {
//        Text("Se riuscite a vedere questo messaggio, tutto appostos")
            
        
        TabView{
            Discover()
                .tabItem {
                    Label(text, systemImage: "rectangle.stack.badge.play")
                }
            
            SearchPage()
                .tabItem {
                    Label(text2, systemImage: "magnifyingglass")
                }
            
            
            SignInApple()
                .tabItem {
                Label(text3, systemImage: "person")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(ColorScheme .dark)
    }
}
