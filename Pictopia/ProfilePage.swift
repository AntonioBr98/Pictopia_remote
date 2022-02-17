//
//  ProfilePage.swift
//  Pictopia
//
//  Created by Antonio Braccolino on 13/02/22.
//

import SwiftUI

struct ProfilePage: View {
    
    var body: some View {
            
        NavigationView {
            Text("Profile,ciaoo")
        }
        .navigationBarTitleDisplayMode(.automatic)
        .navigationTitle("Profile")
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
