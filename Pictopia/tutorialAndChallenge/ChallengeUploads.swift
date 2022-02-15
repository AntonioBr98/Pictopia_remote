//
//  ChallengeUploads.swift
//  Pictopia
//
//  Created by Ramona Ruoppo on 15/02/22.
//

import SwiftUI

struct ChallengeUploads: View {
    @Binding var showChallengeUpdates: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ChallengeUploads_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeUploads(showChallengeUpdates: .constant(true))
    }
}
