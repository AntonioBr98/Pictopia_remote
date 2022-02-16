//
//  ChallengeUploads.swift
//  Pictopia
//
//  Created by Ramona Ruoppo on 15/02/22.
//

import SwiftUI

struct ChallengeUploads: View {
    @Binding var showChallengeUpdates: Bool
    
    let columns: [GridItem] = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
            
        VStack(alignment: .leading) {
                Text("Photo Reference")
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                
                Image("PngLosVigil")
                    .resizable()
                    .scaledToFit()
                
                Text("Challenge Uploads")
                    .font(.title3)
                    .multilineTextAlignment(.leading)

                
                LazyVGrid(columns: columns) {
                    
                    Text("Placeholder")
                    Text("Placeholder")
                    Text("Placeholder")
                    Text("Placeholder")
                    Text("Placeholder")
                    Text("Placeholder")

                }
                
            }
            .padding()
            .navigationTitle("Join the Challenge")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                Button {
                
                } label: {
                    Image(systemName: "plus")
            })
        }
        
    }

struct ChallengeUploads_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeUploads(showChallengeUpdates: .constant(true))
            .preferredColorScheme(ColorScheme .dark)
    }
}
