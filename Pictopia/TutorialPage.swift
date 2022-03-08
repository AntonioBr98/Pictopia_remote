//
//  TutorialPage.swift
//  Pictopia
//
//  Created by Ramona Ruoppo on 17/02/22.
//

import SwiftUI
import AVFoundation

struct LoopingPlayer: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return QueuePlayerUIView(frame: .zero)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Do nothing here
    }
}

class QueuePlayerUIView: UIView {
    private var playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Load Video
        let fileUrl = Bundle.main.url(forResource: "VideoTest", withExtension: "mov")!
        let playerItem = AVPlayerItem(url: fileUrl)
        
        // Setup Player
        let player = AVQueuePlayer(playerItem: playerItem)
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspect
        layer.addSublayer(playerLayer)
        
        // Loop
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        
        // Play
        player.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PlayerUIView: UIView {
    private var playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Load Video
        let fileUrl = Bundle.main.url(forResource: "VideoTest", withExtension: "MOV")!
        let playerItem = AVPlayerItem(url: fileUrl)
        
        // Setup Player
        let player = AVPlayer(playerItem: playerItem)
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        // Loop
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self, selector: #selector(rewindVideo(notification:)), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        // Play
        player.play()
    }
    
    @objc
    func rewindVideo(notification: Notification) {
        playerLayer.player?.seek(to: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct TutorialPage: View {
    let selectedchlg: Item
    @State var showChallengeUploads: Bool = false

    let text11:LocalizedStringKey = "Join"
    let text12:LocalizedStringKey = "Central Perspective"
    
    var body: some View {
            
            VStack{
                LoopingPlayer()
//                    .aspectRatio(contentMode: .fill)
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.horizontal)
                    
//              Join the Challenge button
                NavigationLink(destination: CloudKitCrud(selectedchlg: selectedchlg, showChallengeUpdates: $showChallengeUploads)) {
//                  Label name and arrow
                    HStack {
                        Text(text11)
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
                    .padding()
                
            }
            .navigationTitle(selectedchlg.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(.columns)
            
    }
    
}


//struct TutorialPage_Previews: PreviewProvider {
//    static var previews: some View {
//        TutorialPage()
//    }
//}
