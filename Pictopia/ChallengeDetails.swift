//
//  ChallengeDetails.swift
//  Pictopia
//
//  Created by Ramona Ruoppo on 17/02/22.
//

import Foundation
import SwiftUI

struct challenge {
    var title: String
    var photoref: Image
    var secondTitle: String
}
let test50 = NSLocalizedString("Challenge1", comment: "Ciao")
let test51 = NSLocalizedString("Challenge2", comment: "Ciao")

var firstChallenge = challenge(title: test50, photoref: Image("PngLosVigil"), secondTitle: test51)
