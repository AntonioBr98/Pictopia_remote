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
    
    let centperspect = Item(name:"Central Perspective", image: "cperspective", level: 2, category: ["composition", "MR", "EC"])
    let rulethirds = Item(name:"Rule of Thirds", image: "rthirds", level: 2, category: ["composition", "MR", "EC"])
    let portrait = Item(name:"Portrait", image: "portrait", level: 2, category: ["composition", "MR", "EC"])
    let architectural = Item(name:"Architectural Photography", image: "architectural", level: 2, category: ["composition", "UF"])
    let longexposure = Item(name:"Light Painting", image: "longexposure", level: 2, category: ["lights", "UF", "MR"])
    let bokeh = Item(name:"Effetto Bokeh", image: "bokeh", level: 2, category: ["lights", "UF", "MR"])
    let bandw = Item(name:"Black and White", image: "bandw", level: 2, category: ["lights", "UF", "MR"])

    init() {

        self.allchallenges = [composition, centperspect, rulethirds, bandw, bokeh, longexposure, architectural, portrait]

    }
    
}
