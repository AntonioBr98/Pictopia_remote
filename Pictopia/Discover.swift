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
    @State private var tag = "composition"
    @StateObject var challenges = Challenges()
    
    var body: some View {
        GeometryReader{ reader in
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: spacing), count: number)
       
            NavigationView {
        ScrollView(showsIndicators: false){
            VStack(spacing: 0){
                
                VStack{
                    Text("Most Recent")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding([.top, .leading])
                }
                .frame(width: reader.size.width, alignment: .leading)
                
                ScrollView(.horizontal,showsIndicators: false){
                    LazyHGrid(rows: columns, spacing: spacing){
                            ForEach(challenges.allchallenges.filter { $0.category.contains(tag)}){ item in
                                Button(action: {

                                }){
                                    ItemView(item: item)
                                }
                            }
                        


                    }
                    .padding(.horizontal)
                    .padding(.vertical)
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
                                .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        , alignment: .bottomLeading
                    )
            }
            .frame(width: reader.size.width, height: reader.size.height)
            
        }
        .frame(width: 180, height: 250)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
            .preferredColorScheme(ColorScheme .dark)
    }
}
