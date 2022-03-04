////
////  ChallengeUploads.swift
////  Pictopia
////
////  Created by Ramona Ruoppo on 17/02/22.
////
//
//import SwiftUI
//
//struct ChallengeUploads: View {
//    @Binding var showChallengeUpdates: Bool
//    @State var showActionSheet: Bool = false
//
//
//    let columns: [GridItem] = [GridItem(), GridItem(), GridItem()]
//
//    let text13:LocalizedStringKey = "UnUploaded"
//    let text14:LocalizedStringKey = "OnboardingMessage3"
//    var body: some View {
//
//        VStack(alignment: .leading) {
//
//            Text(firstChallenge.title)
//                    .font(.title)
//                    .fontWeight(.semibold)
//                    .multilineTextAlignment(.leading)
//
//            Image("rthirds")
//                .resizable()
//                .frame(height: 220.0)
//                .cornerRadius(20)
//                .padding(5)
//                .padding()
//                .scaledToFit()
//
//
//            Text(firstChallenge.secondTitle)
//                    .font(.title)
//                    .fontWeight(.semibold)
//                    .multilineTextAlignment(.leading)
//                    .padding(.top)
//
//
////            Message no uploads
//            Text(text13)
//                .font(.title3)
//                .fontWeight(.light)
//                .foregroundColor(Color.gray)
//                .multilineTextAlignment(.leading)
//                .padding(.top, 2)
//
//            Spacer()
//
//
//            }
//            .padding()
//            .navigationTitle(text14)
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarItems(trailing:
//                Button("\(Image(systemName: "plus"))") {
//                showActionSheet.toggle()
//                }
//                .confirmationDialog("What to do?", isPresented: $showActionSheet, titleVisibility: .hidden, actions: {
//                Button("Gallery") {
//                    
//                    
//                }
//            }))
//        }
//}
//
//struct ChallengeUploads_Previews: PreviewProvider {
//    static var previews: some View {
//        ChallengeUploads(showChallengeUpdates: .constant(true))
//            .preferredColorScheme(ColorScheme .dark)
//    }
//}
//
