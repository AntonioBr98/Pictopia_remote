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
                    
                    Image("Icon")
                        .frame(width: 200.0, height: 200.0)
                        .scaleEffect(0.15)
                           
                    Spacer()
                    
                    Text("Login to enjoy all the features!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom)
                               
                    Spacer()
                    
                    HStack(spacing: 35){
                        Image(systemName: "rectangle.stack.badge.play.fill")
                                .frame(width: 60.0, height: 50.0)
                                .scaleEffect(2.8)
                                .foregroundColor(.accentColor)
                                   
                        VStack{
                            Text("Learn Dynamically")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.trailing)
                                .frame(alignment:.leading)
                                       
                            Text("Watch one of the available \ntutorials to learn quickly")
                                .foregroundColor(Color.gray)
                                       
                        }
                                   
                    }
                    
                    Spacer()

                    HStack(spacing: 35){
                        Image(systemName: "photo.fill")
                            .frame(width: 60.0, height: 50.0)
                            .scaleEffect(2.8)
                            .foregroundColor(.accentColor)
                                   
                        VStack{
                            Text("Join Challenges")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.trailing)
                                .frame(alignment:.leading)
                                       
                            Text("Join the challenge by \nby uploading your photo")
                                .foregroundColor(Color.gray)
                                       
                            }
                                   
                        }.padding(.trailing)
                    
                    Spacer()
                        
                    HStack(spacing: 35){
                        Image(systemName: "hand.thumbsup.fill")
                            .frame(width: 60.0, height: 50.0)
                            .scaleEffect(2.8)
                            .foregroundColor(.accentColor)
                                   
                        VStack{
                            Text("React")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.trailing, 120.0)
                                .frame(alignment:.leading)
                                       
                            Text("Give feedback to other \nusers' uploads")
                                .foregroundColor(Color.gray)
                                       
                            }
                                   
                        }.padding(.trailing)
                        .padding(.bottom, 50)
                    

                               
                    SignInButtonView()
                    
                }
                
                else {
                    Profile()
                    
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

struct Profile: View {
    
    @State var changeProfileImage: Bool = false
    @State var openCamera: Bool = false
    @State var imageSelected = UIImage()
    
    // Samples
    @AppStorage ("email") var email: String = ""
    @AppStorage ("firstName") var firstName: String = ""
    @AppStorage ("lastName") var lastName: String = ""
    @AppStorage ("userId") var userId: String = ""

    var body: some View {
            VStack {
                
//              Image picker
                ZStack(alignment: .bottomTrailing) {
                    
                    Button(action: {
                        changeProfileImage = true
                        openCamera = true
                        
                    }, label: {
                        
                        if changeProfileImage {
                            Image(uiImage: imageSelected)
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                                .clipShape(Circle())
                                .padding()
                        } else {
                        Image("profileIcon")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .clipShape(Circle())
                            .padding()
                        }
                    })
                    
                    Image(systemName: "plus")
                        .frame(width: 30, height: 30)
                        .foregroundColor(.yellow)
                        .background(Color.gray)
                        .clipShape(Circle())
                }
                .sheet(isPresented: $openCamera) {
                    ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                }
                
                
                
                Text("\(firstName) \(lastName)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
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
//
//struct SignInApple_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInApple()
//    }
//}
