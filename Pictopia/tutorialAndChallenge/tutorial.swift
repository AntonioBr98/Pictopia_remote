//
//  tutorial.swift
//  Pictopia
//
//  Created by Ramona Ruoppo on 15/02/22.
//

import SwiftUI
import AVKit
import UIKit

struct tutorial: View {
    @State var showChallengeUploads: Bool = false
//    @State private var player = AVPlayer()
    
    
    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "VideoTest", ofType: "MOV")!))
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                VideoPlayer(player: player)
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    
                NavigationLink(destination: ChallengeUploads(showChallengeUpdates: $showChallengeUploads)) {
//                  Label name and arrow
                    HStack {
                        Text("Join the Challenge")
                            .padding()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding()
                    }
                    }
                    .foregroundColor(.white)
                    .frame(width: 370, height: 55)
                    .background(.quaternary)
                    .mask(RoundedRectangle(cornerRadius: 20))
                    .offset(y: 230)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                Button{
                
                } label: {
                    Image(systemName: "chevron.backward.circle.fill")
                        .foregroundColor(Color.white)
                        .padding(.top)
                        .font(.title3)
                })
            .navigationViewStyle(.columns)
        }

    }
    
}

struct tutorial_Previews: PreviewProvider {
    static var previews: some View {
        tutorial()
            .preferredColorScheme(ColorScheme .dark)
    }
}
