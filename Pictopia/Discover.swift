//
//  Discover.swift
//  Pictopia
//
//  Created by Alba Capasso on 13/02/22.
//

import SwiftUI



struct Discover: View {
    @AppStorage("showOnBoarding") var showOnboarding: Bool = true
    
    let spacing:CGFloat = 15
    @State private var number = 1
    @State private var tag1 = "composition"
    @StateObject var challenges = Challenges()
    @StateObject var explore = ExploreItems()
    @State private var nav = false
    
    let text10:LocalizedStringKey = "Discover"
    
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
                                    ForEach(challenges.alltopics.filter { $0.category.contains(expitem.tag)}){ item in
                                        NavigationLink (destination: Challenge(item: item))
//                                        Button(action: {
//                                        nav=true
//                                        })
                                        {
                                            ItemView(item: item)
//                                                .mask(
//                                                    Text("SWIFT!")
//                                                        .font(.system(size: 40))
//                                                        .fontWeight(.heavy)
//                                                    )
                                        }
                                    }
                                    
                                }
                                .padding(.horizontal)
                                .padding(.vertical)
                            }
                            
                        }
                    }
                }
//<<<<<<< HEAD
                .navigationTitle(text10)
//=======
                .navigationTitle("Discover")
                .navigationBarItems(trailing:
                        Button{
//              Onboading view info
                    showOnboarding.toggle()
                        } label: {
                            Image(systemName: "info.circle")
                })
//>>>>>>> 6309b3a383d63207cfd5dcede9fadbaca07ae6b3
            }
            .fullScreenCover(isPresented: $showOnboarding, content: { OnboardingView(showOnboarding: $showOnboarding)})
            
        }

}
}

struct ItemView: View {
    
    let item:Item
    
    let text9:LocalizedStringKey = "Coming Soon"
    
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
                       Text(text9)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        }
                    )
//                    .background(Color.white)
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
//                        prova
//                        LinearGradient(
//                                gradient: Gradient(stops: [
//                                    Gradient.Stop(color: .black, location: 0.7),
//                                    Gradient.Stop(color: .black.opacity(0.3), location: 0.3)
//                                ]),
//                                startPoint: .top,
//                                endPoint: .bottom)
                        
//                        fine prova
                        
                        
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

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
            .preferredColorScheme(ColorScheme .dark)
    }
}
