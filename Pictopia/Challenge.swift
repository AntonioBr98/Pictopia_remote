//
//  Challenge.swift
//  Pictopia
//
//  Created by Alba Capasso on 17/02/22.
//

import SwiftUI

struct Challenge: View {
    
    let spacing:CGFloat = 10
    let item:Item
    @State private var number = 1
    @StateObject var challenges = Challenges()
    @StateObject var explore = ExploreItems()
    
    var body: some View {
        GeometryReader{ reader in
            let columns = Array(
                repeating: GridItem(.flexible(), spacing: spacing), count: number)
            

                ScrollView(showsIndicators: false){
                    
                        
                        VStack(spacing: 0){
                            VStack{
                                Text("Challenges")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .padding([.top, .leading])
                            }
                            .frame(width: reader.size.width, alignment: .leading)
                            
                            ScrollView(showsIndicators: false){
                                LazyVGrid(columns: columns, spacing: spacing){
                                    ForEach(challenges.allchallenges.filter { $0.category.contains(item.name)}){ item in
                                        NavigationLink (destination: Tutorialpage())
//                                        Button(action: {
//                                        })
                                        {
                                            HItemView(item: item)
                                        }
                                    }
                                    
                                }
                                .padding(.horizontal)
                                .padding(.vertical)
                            }
                            
                        }
                }
                .navigationTitle("Challenge")

            
        }
    }
}

struct HItemView: View {
    
    let item:Item
    var body: some View {
        
        GeometryReader{ reader in
            
            let imageWidth: CGFloat = reader.size.width
            
            ZStack{
                Image(item.image)
                    .resizable()
                  .mask(
                    LinearGradient(
                            gradient: Gradient(stops: [
                                Gradient.Stop(color: .black.opacity(0.5), location: 0.5),
                                Gradient.Stop(color: .black, location: 0.5)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    
//                    LinearGradient(gradient: Gradient(colors: [.black.opacity(0.5), .black ]), startPoint: .trailing, endPoint: .topLeading)
                  )
                    .scaledToFill()
                    .cornerRadius(10)
                    .frame(width: imageWidth)

            }
            .frame(width: reader.size.width, height: reader.size.height)
            .overlay(
                Text (item.name)
                    .font(.title3)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .leading])
                , alignment: .topLeading
            )
            
        }
        .frame(height: 120)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

//struct Challenge_Previews: PreviewProvider {
//    static var previews: some View {
//        Challenge()
//        
//            .preferredColorScheme(ColorScheme .dark)
//    }
//}
