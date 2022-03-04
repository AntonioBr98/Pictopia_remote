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
    
    
    let text5:LocalizedStringKey = "Challenges"
    
    
    
    var body: some View {
        GeometryReader{ reader in
            let columns = Array(
                repeating: GridItem(.flexible(), spacing: spacing), count: number)
            

                ScrollView(showsIndicators: false){
                    
                        
                        VStack(spacing: 0){
                            VStack{
                                Text(text5)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .padding([.top, .leading])
                            }
                            .frame(width: reader.size.width, alignment: .leading)
                            
                            ScrollView(showsIndicators: false){
                                LazyVGrid(columns: columns, spacing: spacing){
                                    ForEach(challenges.allchallenges.filter { $0.category.contains(item.image)}){ item in
                                        NavigationLink (destination: TutorialPage())
//                                        Button(action: {
//                                        })
                                         { HItemView(item: item)   }
                                    }
                                    
                                }
                                .padding(.horizontal)
                                .padding(.vertical)
                            }
                            
                        }
                }
                .navigationTitle(item.name)

            
        }
    }
}

struct HItemView: View {
    
    let item:Item
    
    let text9:LocalizedStringKey = "Coming Soon"
    
    var body: some View {
        
        GeometryReader{ reader in
            
            let imageWidth: CGFloat = reader.size.width
            
            if item.active==2 {
            
            ZStack{
                Image(item.image)
                    .resizable()
                    .mask(
                        ZStack{
                            Color.black.opacity(0.4)
                       Text(text9)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        }
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
//            here
            else {
            
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
//            here
            
        }
        .frame(height: 120)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

//struct Challenge_Previews: PreviewProvider {
//    static var previews: some View {
//        Challenge(item: <#Item#>)
//        
//            .preferredColorScheme(ColorScheme .dark)
//    }
//}
