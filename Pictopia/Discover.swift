//
//  Discover.swift
//  Pictopia
//
//  Created by Antonio Braccolino on 13/02/22.
//

import SwiftUI



struct Discover: View {
    
    let spacing:CGFloat = 10
    @State private var number = 1
    @State private var tag1 = "composition"
    @StateObject var challenges = Challenges()
    @StateObject var explore = ExploreItems()
    @State private var nav = false
    
    var body: some View {
        
        GeometryReader{ reader in
            let columns = Array(
                repeating: GridItem(.flexible(), spacing: spacing), count: number)
            
            NavigationView {
                ScrollView(showsIndicators: false){
                    
                    ForEach(explore.exploreitems){ expitem in
                        
                        VStack(spacing: 0){
                            VStack{
                                Text(expitem.name)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .padding([.top, .leading])
                            }
                            .frame(width: reader.size.width, alignment: .leading)
                            
                            ScrollView(.horizontal,showsIndicators: false){
                                LazyHGrid(rows: columns, spacing: spacing){
                                    ForEach(challenges.allchallenges.filter { $0.category.contains(expitem.tag)}){ item in
                                        NavigationLink (destination: Challenge(item: item))
//                                        Button(action: {
//                                        nav=true
//                                        })
                                        {
                                            ItemView(item: item)
                                        }
                                    }
                                    
                                }
                                .padding(.horizontal)
                                .padding(.vertical)
                            }
                            
                        }
                    }
                }
                .navigationTitle("Discover")
            }
            
        }

}
}

struct ItemView: View {
    
    let item:Item
    var body: some View {
        
        GeometryReader{ reader in
            
            let imageWidth: CGFloat = min(180, reader.size.width * 0.6)
            
            ZStack{
                Image(item.image)
                    .resizable()
                    .mask(
                        LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .bottom, endPoint: .top)
                    )
                    .scaledToFill()
                    .cornerRadius(10)
                    .frame(width: imageWidth)
                    .overlay(
                        Text (item.name)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                        , alignment: .bottomLeading
                    )
            }
            .frame(width: reader.size.width, height: reader.size.height)
            
        }
        .frame(width: 160, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
            .preferredColorScheme(ColorScheme .dark)
    }
}
