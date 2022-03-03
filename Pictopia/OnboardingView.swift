//
//  OnboardingView.swift
//  Pictopia
//
//  Created by Ramona Ruoppo on 22/02/22.
//

import SwiftUI

struct OnboardingView: View {

    @Binding var showOnboarding: Bool
    let test52 = NSLocalizedString("OnboardingMessage1", comment: "Ciao")
    let test53 = NSLocalizedString("OnboardingMessage2", comment: "Ciao")
    let test54 = NSLocalizedString("OnboardingMessage3", comment: "Ciao")
    let test55 = NSLocalizedString("Skip", comment: "Ciao")
    
    
    var body: some View {
        
        NavigationView {
            TabView {
                
    //       Onboarding
                PageView(
                    imageName: "onboard1",
                    title: test52, showsDismissButton: false, showOnboarding: $showOnboarding
                    )
                    .padding(.bottom, 100)

                
                PageView(
                    imageName: "onboard2", title: test53, showsDismissButton: false, showOnboarding: $showOnboarding
                    )
                    .padding(.bottom, 100)

                

                PageView(
                    imageName: "onboard3",
                    title: test54, showsDismissButton: true, showOnboarding: $showOnboarding
                    )
                    .padding(.bottom, 100)

                    
                }
            .tabViewStyle(.page(indexDisplayMode: .always))
                    .edgesIgnoringSafeArea(.bottom)
            //      Skip button
                    .navigationBarItems(trailing:
                            Button(test55) {
                            showOnboarding.toggle()
                })
        }
        }
    }



//First onboarding page
struct PageView: View {
    let imageName: String
    let title: String
    let showsDismissButton: Bool
    @Binding var showOnboarding: Bool
    
    let text56:LocalizedStringKey = "Begin"
    
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
                    Text(text56)
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

