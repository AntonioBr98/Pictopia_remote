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
    @StateObject var challenges = Challenges()
    
    var body: some View {
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: spacing), count: number)
        ZStack{
            VStack(spacing: 0){
                ScrollView(.horizontal){
                    LazyHGrid(rows: columns, spacing: spacing){
                            ForEach(challenges.allchallenges.filter { $0.category.contains("composition")}){ item in
                                Button(action: {

                                }){
                                    ItemView(item: item)
                                }
                            }
                        


                    }
                    .padding(.horizontal)
                    .padding(.vertical
                    )
                }
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
                    .scaledToFill()
                    .cornerRadius(10)
                    .frame(width: imageWidth)
                Text (item.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
            }
            .frame(width: reader.size.width, height: reader.size.height)
//            .background(Color.red)
            
        }
        .frame(width: 180, height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.2), radius: 20, y: 5)
        
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
            .preferredColorScheme(ColorScheme .dark)
    }
}
