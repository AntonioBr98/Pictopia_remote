//
//  tutorial.swift
//  Pictopia
//
//  Created by Ramona Ruoppo on 15/02/22.
//

import SwiftUI
import AVKit

struct tutorial: View {
    @State var showChallengeUploads: Bool = false
    @State private var player = AVPlayer()
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                VideoPlayer(player: AVPlayer())
           
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
//                  .foregroundColor(.white)
                    .frame(width: 370, height: 55)
                    .background(.secondary)
                    .mask(RoundedRectangle(cornerRadius: 20))
                    .offset(y: 260)

            }
            .edgesIgnoringSafeArea(.all)
            
        }
//        .navigationBarItems(leading:
//                                Button("\(Image:(systemName: "chevron.backward.circle.fill"))")
//        )
    }
}

struct tutorial_Previews: PreviewProvider {
    static var previews: some View {
        tutorial()
    }
}
