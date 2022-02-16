//
//  Challenges.swift
//  Pictopia
//
//  Created by Dario Vigilante on 15/02/22.
//

import Foundation
import SwiftUI

class Challenges: ObservableObject {
    
    @Published var allchallenges = [Item]()

    let composition = Item(name:"Central Perspective", image: "House", level: 2, category: ["Toplvl"])
    
    let centperspect = Item(name:"Central Perspective", image: "cperspective", level: 2, category: ["composition"])
    let rulethirds = Item(name:"Rule of Thirds", image: "rthirds", level: 2, category: ["composition"])
    let centperspect2 = Item(name:"Central Perspective", image: "cperspective", level: 2, category: ["composition"])
    let rulethirds2 = Item(name:"Rule of Thirds", image: "rthirds", level: 2, category: ["composition"])
    
    let lightpainting = Item(name:"Light Painting", image: "Lightpainting", level: 2, category: ["lights"])

    init() {

        self.allchallenges = [composition, centperspect, rulethirds, centperspect2, rulethirds2]

    }
    
}
