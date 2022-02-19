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
    
//    TOPIC

    let composition = Item(name:"Composition", image: "composition", active: 0, category: ["MR", "EC2"])
    let portrait = Item(name:"Portrait", image: "portrait", active: 2, category: ["MR", "EC"])
    let photobasics = Item(name:"Photography Basics", image: "photobasics", active: 2, category: ["MR", "EC"])
    let bandw = Item(name:"Black and White", image: "bandw", active: 2, category: ["UF", "MR"])
    let macro = Item(name:"Macro", image: "macro", active: 2, category: ["UF", "MR"])
    let streetph = Item(name:"Street Photography", image: "streetph", active: 2, category: ["UF", "MR"])
    let architectural = Item(name:"Architecture Photography", image: "architectural", active: 2, category: ["UF"])
    let lights = Item(name:"Lights", image: "lights", active: 0, category: ["MR"])
    let lighteffects = Item(name:"Lights", image: "lighteffects", active: 2, category: ["MR"])
    let food = Item(name:"Food", image: "food", active: 2, category: ["MR"])
    let abstract = Item(name:"Abstract", image: "abstract", active: 2, category: ["MR"])
    let landscape = Item(name:"Landscape", image: "landscape", active: 2, category: ["MR"])
    let colors = Item(name:"Colors", image: "colors", active: 2, category: ["MR"])
    let sport = Item(name:"Sport", image: "sport", active: 2, category: ["MR"])
    let nature = Item(name:"Nature", image: "nature", active: 2, category: ["MR"])
    let fashion = Item(name:"Fashion", image: "fashion", active: 2, category: ["MR"])
    let wedding = Item(name:"Wedding", image: "wedding", active: 2, category: ["MR"])
    let documentary = Item(name:"Real Life", image: "documentary", active: 2, category: ["MR"])
    let lenses = Item(name:"Lenses", image: "lenses", active: 2, category: ["MR"])
    
    
//    CHALLENGES
    
    let rulethirds = Item(name:"Rule of Thirds", image: "rthirds", active: 0, category: ["composition"])
    let centperspect = Item(name:"Central Perspective", image: "cperspective", active: 2, category: ["composition"])
    let longexposure = Item(name:"Light Painting", image: "longexposure", active: 2, category: ["lights"])
    let bokeh = Item(name:"Effetto Bokeh", image: "bokeh", active: 2, category: ["lights"])

    init() {

        self.allchallenges = [composition,lights,portrait,photobasics,bandw,macro,streetph,architectural,lighteffects,food,abstract,landscape,colors,sport,nature,fashion,wedding,documentary,lenses,rulethirds,centperspect,longexposure,bokeh]

    }
    
}
