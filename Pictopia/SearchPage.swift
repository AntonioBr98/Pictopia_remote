//
//  SearchPage.swift
//  Pictopia
//
//  Created by Dario Vigilante on 21/02/22.
//

import SwiftUI






struct SearchPage: View {
    
    let spacing:CGFloat = 15
    @State private var number = 1
    @State private var searchText = ""
    @StateObject var challenges = Challenges()
    @StateObject var explore = ExploreItems()
    @State private var nav = false
    
    
    let text4:LocalizedStringKey = "Topics"
    let text5:LocalizedStringKey = "Challenges"
    let text6:LocalizedStringKey = "Search"
    let text7:LocalizedStringKey = "Type to Search"
   
    
    var body: some View {
        
        GeometryReader{ reader in
            let columns = Array(
                repeating: GridItem(.flexible(), spacing: spacing), count: 2)
            let rows = Array(
                repeating: GridItem(.flexible(), spacing: spacing), count: number)
            
            NavigationView {
                
                VStack{
                    ScrollView(showsIndicators: false){
                        VStack{
                        Text(text4)
//                             for \(searchText)")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding([.top, .leading])
                    }
                    .frame(width: reader.size.width, alignment: .leading)
                            
                            ScrollView(.horizontal,showsIndicators: false){
                                LazyHGrid(rows: rows, spacing: spacing){
                                    if searchText != "" {
                                    ForEach(challenges.alltopics.filter { $0.name.contains(searchText)}){ item in
                                        NavigationLink (destination: Challenge(item: item)){
                                            SearchTopicItemView(item: item)
                                        }
                                    }
                                    }
                                    else {
                                        ForEach(challenges.alltopics){ item in
                                            NavigationLink (destination: Challenge(item: item))
                                            {
                                                SearchTopicItemView(item: item)
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)

                            }

                            VStack{
                            Text(text5)
//                                 for \(searchText)")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding([.top, .leading])
                        }
                        .frame(width: reader.size.width, alignment: .leading)
                            
                                LazyVGrid(columns: columns, spacing: spacing){
                                    if searchText != "" {
                                    ForEach(challenges.allchallenges.filter { $0.name.contains(searchText)}){ item in
                                        NavigationLink (destination: TutorialPage(selectedchlg: item))
                                         { SearchChallengeItemView(item: item)   }
                                    }
                                    }
                                    else {
                                        ForEach(challenges.allchallenges){ item in
                                            NavigationLink (destination: TutorialPage(selectedchlg: item))
                                            {
                                                SearchChallengeItemView(item: item)
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                        }
                }
                .navigationTitle(text6)
                
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt:
            text7)
        }

}
}

struct SearchTopicItemView: View {
    
    let item:Item
    let text8:LocalizedStringKey = "Coming Soon"
    
    var body: some View {
        
        GeometryReader{ reader in
            
            let imageWidth: CGFloat = min(180, reader.size.width * 0.6)
            
            if item.active==2 {
            
            ZStack{
                Image(item.image)
                    .resizable()
                    .mask(
                        ZStack{
                            Color.black.opacity(0.4)
                       Text(text8)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        }
                    )
                    .scaledToFill()
                    .cornerRadius(10)
                    .frame(width: imageWidth)
                    .overlay(
                        Text (item.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom)
                        , alignment: .bottomLeading
                    )
            }
            .frame(width: reader.size.width, height: reader.size.height)
            }
            else {
            
            ZStack{
                Image(item.image)
                    .resizable()
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                    )
                    .scaledToFill()
                    .cornerRadius(10)
                    .frame(width: imageWidth)
                    .overlay(
                        Text (item.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom)
                        , alignment: .bottomLeading
                    )
            }
            .frame(width: reader.size.width, height: reader.size.height)
            }
            
        }
        .frame(width: 160, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}


struct SearchChallengeItemView: View {
    
    let item:Item
    var body: some View {
        
        GeometryReader{ reader in
            
            let imageWidth: CGFloat = reader.size.width
            
                VStack{
            ZStack{
                Image(item.image)
                    .resizable()
                    .mask(
                        RadialGradient(gradient: Gradient(colors: [.black, .black.opacity(0.5)]), center: .center, startRadius: 0, endRadius: 50)
                                    )
                  .overlay(
                      Text (item.name)
                          .font(.subheadline)
                          .fontWeight(.semibold)
                          .foregroundColor(Color.white)
                          .multilineTextAlignment(.leading)
                      , alignment: .center
                  )
                    .scaledToFill()
                    .cornerRadius(10)
                    .frame(width: imageWidth)

            }
            .frame(width: reader.size.width, height: reader.size.height)
               
                    Text (item.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
//                    .padding([.top, .leading])
                    }

            
        }
        .frame(height: 80)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}



struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage()
        
    }
}
