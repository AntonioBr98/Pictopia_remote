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
            Text(firstChallenge.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                
            Image("PngLosVigil")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                
            Text(firstChallenge.secondTitle)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)

                
                LazyVGrid(columns: columns) {
                    Image("PngLosVigil")
                    Image("PngLosVigil")
                    Image("PngLosVigil")
                    Image("PngLosVigil")

//                    Image("PngLosVigil")
//                        .resizable()
//                        .scaledToFit()
//                    Image("PngLosVigil")
//                        .resizable()
//                        .scaledToFit()
                }
                .resizable()
                .scaledToFit()
                .cornerRadius(20)

                
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
