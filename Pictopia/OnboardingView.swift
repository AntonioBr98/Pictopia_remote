//
//  OnboardingView.swift
//  Pictopia
//
//  Created by Ramona Ruoppo on 22/02/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var showOnboarding: Bool
    
    var body: some View {
        
        TabView {
            
//       Onboarding
            PageView(
                imageName: "onboard1",
                title: "Dive \nyourself \ninto photography!", showsDismissButton: false, showOnboarding: $showOnboarding
                )

            
            PageView(
                imageName: "onboard2", title: "Choose one of the tutorials available in the Discover page and start learning.", showsDismissButton: false, showOnboarding: $showOnboarding
                )
            

            PageView(
                imageName: "onboard3",
                title: "Join the \nchallenge by \nuploading yuor photo", showsDismissButton: true, showOnboarding: $showOnboarding
                )
            
                
                
            }
        .navigationBarTitleDisplayMode(.inline)
                .edgesIgnoringSafeArea(.bottom)
        //      Skip button
                .navigationBarItems(trailing:
                        Button("Skip") {
                        showOnboarding.toggle()
        //                HomeView()
                        })
                .tabViewStyle(.page(indexDisplayMode: .always))
        }
    }



//First onboarding page
struct PageView: View {
    let imageName: String
    let title: String
    let showsDismissButton: Bool
    @Binding var showOnboarding: Bool
    
    var body: some View {
        VStack(spacing: 35) {
            
            Image(imageName)
                .scaleEffect(0.8)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(width: 310, alignment: .leading)
            
            
            if showsDismissButton {
                Button(action: {
//                    Discover()
                    showOnboarding.toggle()
                    
                }, label: {
                    Text("Let's begin")
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 350, height: 42)
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(.top, 50)
                })
            }
        }


    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(showOnboarding: .constant(true))
    }
}

