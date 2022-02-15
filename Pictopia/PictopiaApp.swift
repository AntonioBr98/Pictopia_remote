//
//  PictopiaApp.swift
//  Pictopia
//
//  Created by Antonio Braccolino on 13/02/22.
//

import SwiftUI

@main
struct PictopiaApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .preferredColorScheme(ColorScheme .dark)
//            CloudKitUser()
//                .preferredColorScheme(ColorScheme .dark)
            CloudKitCrud()
                .preferredColorScheme(ColorScheme .dark)
        }
    }
}
