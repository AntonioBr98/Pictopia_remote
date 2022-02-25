//
//  ProfilePage.swift
//  Pictopia
//
//  Created by Antonio Braccolino on 13/02/22.
//

import SwiftUI

struct ProfilePage: View {

    var body: some View {
            VStack {
                Image(systemName: "person.crop.circle")
                    .scaleEffect(5)
                    .frame(width: 85, height: 85, alignment: .center)
                    .padding()
                Text("Name Surname")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                List {
                    

                    Text("WORK IN PROGRESS")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.32))
                        .multilineTextAlignment(.center)
                }
                .navigationTitle("Profile")

            }
        }
    }


//struct ProfilePage_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfilePage()
//    }
//}
