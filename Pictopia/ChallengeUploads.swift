//
//  ChallengeUploads.swift
//  Pictopia
//
//  Created by Ramona Ruoppo on 17/02/22.
//

import SwiftUI

struct ChallengeUploads: View {
    @Binding var showChallengeUpdates: Bool
    @State var showActionSheet: Bool = false

    
    let columns: [GridItem] = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
            
        VStack(alignment: .leading) {
            
            Text(firstChallenge.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
            
            Image("rthirds")
                .resizable()
                .frame(height: 220.0)
                .cornerRadius(20)
                .padding(5)
                .padding()
                .scaledToFit()
            
                
            Text(firstChallenge.secondTitle)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding(.top)
            

//            Message no uploads
            Text("Uploaded photos not yet available")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
                .padding(.top, 2)
                
            Spacer()

//                LazyVGrid(columns: columns) {
//                    Image("PngLosVigil")
//                        .resizable()
//                        .scaledToFit()
//                        .cornerRadius(20)
//                    Image("PngLosVigil")
//                        .resizable()
//                        .scaledToFit()
//                        .cornerRadius(20)
//                    Image("PngLosVigil")
//                        .resizable()
//                        .scaledToFit()
//                        .cornerRadius(20)
//                    Image("PngLosVigil")
//                        .resizable()
//                        .scaledToFit()
//                        .cornerRadius(20)
//                }
                
            }
            .padding()
            .navigationTitle("Join the Challenge")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                Button("\(Image(systemName: "plus"))") {
                showActionSheet.toggle()
                }
                .confirmationDialog("What to do?", isPresented: $showActionSheet, titleVisibility: .hidden, actions: {
                Button("Gallery") {}
            }))
        }
}

struct ChallengeUploads_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeUploads(showChallengeUpdates: .constant(true))
            .preferredColorScheme(ColorScheme .dark)
    }
}

