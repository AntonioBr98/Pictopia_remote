//
//  ContentView.swift
//  Pictopia
//
//  Created by Antonio Braccolino on 13/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("Se riuscite a vedere questo messaggio, tutto appostos")
            
        
        TabView{
            TutorialPage()
                .tabItem {
                    Label("Discover", systemImage: "rectangle.stack.badge.play")
                }
            
            SearchPage()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            
            ProfilePage()
                .tabItem {
                Label("Profile", systemImage: "person")
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
