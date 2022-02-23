//
//  SignIn.swift
//  Pictopia
//
//  Created by Alba Capasso on 23/02/22.
//
import AuthenticationServices
import SwiftUI

struct SignIn: View {
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage ("email") var email: String
    @AppStorage ("firstName") var firstName: String
    @AppStorage ("lastName") var lastName: String
    @AppStorage ("userId") var userId: String
    
    var body: some View {
        NavigationView {
            VStack{
                
                if userId.isEmpty {
                    
                    SignInWithAppleButton(.continue) { request in
                    
                    request.requestedScopes = [.email, .fullName]
                } onCompletion: { result in
                    
                    switch result {
                    case .success(let auth):
                        
                        switch auth.credential {
                            case let credential as ASAuthorizationAplleIDCredential:
                           
                            //USER ID
                            let userdId = credential.user
                            
                            //USER INFO
                            let email = credential.email
                            let firstName = credential.fullName?.givenName
                            let lastName = credential.fullName?.familyName
                            
                            self.email = email ?? ""
                            self.userId = iserId
                            self.lastName = lastName ?? ""
                            self.firstName = firstName ?? ""
                            
                            
                        default:
                            break
                        }
                    case .failure(let error):
                        print(error)
                    }
                    
                }
                .signInWithAppleButtonStyle(
                    colorScheme == .dark ? .withe : .black
                )
                .frame(height: 50)
                .padding()
                .cornerRadius(8)
                    
                }
                else {
                    //Signed In
                }
        }
    } .navigationTitle("Sign In")
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
