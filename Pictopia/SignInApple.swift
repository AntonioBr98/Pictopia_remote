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
    
    
    let text30:LocalizedStringKey = "Profilo1"
    let text31:LocalizedStringKey = "Profilo2"
    let text32:LocalizedStringKey = "Profilo3"
    let text33:LocalizedStringKey = "Profilo4"
    let text34:LocalizedStringKey = "Profilo5"
    let text35:LocalizedStringKey = "Profilo6"
    let text36:LocalizedStringKey = "Profilo7"
    let text37:LocalizedStringKey = "Profilo9"
  
    
    var body: some View {
        NavigationView {
            VStack {
                
                if userId.isEmpty {
                    
                    Image("Icon")
                        .frame(width: 200.0, height: 200.0)
                        .scaleEffect(0.15)
                        .padding()
                           
                    Spacer()
                    
                    Text(text30)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom)
                               
                    Spacer()
                    
                    VStack(alignment: .leading) {

                        Spacer()
                    
                        HStack(spacing: 25){
                            Image(systemName: "rectangle.stack.badge.play.fill")
                                    .frame(width: 60.0, height: 50.0)
                                    .scaleEffect(2.2)
                                    .foregroundColor(.accentColor)
                                       
                            VStack(alignment: .leading){
                                Text(text31)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .padding(.trailing)
                                    .frame(alignment:.leading)
                                           
                                Text(text32)
                                    .foregroundColor(Color.gray)
                                           
                            }
                                       
                        }
                    
                        Spacer()

                        HStack(spacing: 25){
                            Image(systemName: "photo.fill")
                                .frame(width: 60.0, height: 50.0)
                                .scaleEffect(2.2)
                                .foregroundColor(.accentColor)
                                       
                            VStack(alignment: .leading){
                                Text(text33)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .padding(.trailing)
                                    .frame(alignment:.leading)
                                           
                                Text(text34)
                                    .foregroundColor(Color.gray)
                                           
                                }
                                       
                        }
                        .padding(.trailing)
                    
                        Spacer()
                        
                        HStack(spacing: 25){
                            Image(systemName: "hand.thumbsup.fill")
                                .frame(width: 60.0, height: 50.0)
                                .scaleEffect(2.2)
                                .foregroundColor(.accentColor)
                                       
                            VStack(alignment: .leading){
                                Text(text35)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .padding(.trailing, 120.0)
                                    .frame(alignment:.leading)
                                           
                                Text(text36)
                                    .foregroundColor(Color.gray)
                                           
                                }
                                       
                        }
                        .padding(.trailing)
                        .padding(.bottom, 50)
                    
                    }
                    .padding(.leading, 20.0)
                               
                    SignInButtonView()
                        .padding(.bottom)
                    
                }
                
                else {
                    Profile()
                    
                }
                
            }
            .navigationTitle(text37)
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
    
    let text38:LocalizedStringKey = "Profilo8"
    let text39:LocalizedStringKey = "Profilo10"
    let text40:LocalizedStringKey = "Profilo9"

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
                    Text(text38)
                    Text(text39)

                }
                .navigationTitle(text40)

            }
        }
    }


struct SignInApple_Previews: PreviewProvider {
    static var previews: some View {
        SignInApple()
    }
}
