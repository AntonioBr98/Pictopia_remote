//
//  SignInApple.swift
//  Pictopia
//
//  Created by Alba Capasso and Ramona Ruoppo on 23/02/22.
//

import SwiftUI
import AuthenticationServices

struct SignInApple: View {
    
    // To support the color of the button based on the appearance observing the colorScheme
    @Environment(\.colorScheme) var colorScheme
    
    // Samples
    @AppStorage ("email") var email: String = ""
    @AppStorage ("firstName") var firstName: String = ""
    @AppStorage ("lastName") var lastName: String = ""
    @AppStorage ("userId") var userId: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                if userId.isEmpty {
                    SignInButtonView()
                }
                
                else {
                    ProfilePage()
                    
                }
                
            }
            .navigationTitle("Profile")
        }
    }
}


// Sign in button view

struct SignInButtonView: View {

    
    // To support the color of the button based on the appearance observing the colorScheme
    @Environment(\.colorScheme) var colorScheme
    
    // Samples
    @AppStorage ("email") var email: String = ""
    @AppStorage ("firstName") var firstName: String = ""
    @AppStorage ("lastName") var lastName: String = ""
    @AppStorage ("userId") var userId: String = ""

    var body: some View {
        
        // Sign-In button
        SignInWithAppleButton(.continue) { request in
            
            // Declare what we want to take from our request
            request.requestedScopes = [.email, .fullName]

        } onCompletion: { result in
            
            switch result {
                
            // Success case
            case .success(let auth):
                
                switch auth.credential {
                    case let credential as ASAuthorizationAppleIDCredential:
                   
                    // User Id
                    let userId = credential.user
                    
                    // User Info
                    let email = credential.email
                    let firstName = credential.fullName?.givenName
                    let lastName = credential.fullName?.familyName
                    
                    self.email = email ?? ""
                    self.userId = userId
                    self.lastName = lastName ?? ""
                    self.firstName = firstName ?? ""
                                                
                    print(userId)
                    
                default:
                    print(auth.credential)
                    break
                }
                
//                      Failure case that gives us error
            case .failure(let error):
                print(error)
            }
        }
//                  Addding the modifier for the Color based on the appearance
        .signInWithAppleButtonStyle(
            colorScheme == .dark ? .white : .black
        )
//                  Editing of the button
        .frame(height: 50)
        .padding()
        .cornerRadius(12)
    }
}

struct ProfilePage: View {
    
    // Samples
    @AppStorage ("email") var email: String = ""
    @AppStorage ("firstName") var firstName: String = ""
    @AppStorage ("lastName") var lastName: String = ""
    @AppStorage ("userId") var userId: String = ""

    var body: some View {
            VStack {
                Image(systemName: "person.crop.circle")
                    .scaleEffect(5)
                    .frame(width: 85, height: 85, alignment: .center)
                    .padding()
                
                Text(userId)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                
                List {
                    Text("Joined Challenges - NOT WORKING")
                    Text("Badges - NOT WORKING")

                }
                .navigationTitle("Profile")

            }
        }
    }

struct SignInApple_Previews: PreviewProvider {
    static var previews: some View {
        SignInApple()
    }
}
