//
//  Challenges.swift
//  Pictopia
//
//  Created by Dario Vigilante on 15/02/22.
//

import Foundation
import SwiftUI

//let text1: String = "Composition"
let test1 = NSLocalizedString("Composition", comment: "Ciao")
let test2 = NSLocalizedString("Portrait", comment: "Ciao")
let test3 = NSLocalizedString("Photography Basics", comment: "Ciao")
let test4 = NSLocalizedString("Black and White", comment: "Ciao")
let test5 = NSLocalizedString("Macro", comment: "Ciao")
let test6 = NSLocalizedString("Street Photography", comment: "Ciao")
let test7 = NSLocalizedString("Architecture Photography", comment: "Ciao")
let test8 = NSLocalizedString("Lights", comment: "Ciao")
let test9 = NSLocalizedString("Food", comment: "Ciao")
let test10 = NSLocalizedString("Abstract", comment: "Ciao")
let test11 = NSLocalizedString("Landscape", comment: "Ciao")
let test12 = NSLocalizedString("Colors", comment: "Ciao")
let test13 = NSLocalizedString("Sport", comment: "Ciao")
let test14 = NSLocalizedString("Nature", comment: "Ciao")
let test15 = NSLocalizedString("Fashion", comment: "Ciao")
let test16 = NSLocalizedString("Wedding", comment: "Ciao")
let test17 = NSLocalizedString("Real Life", comment: "Ciao")
let test18 = NSLocalizedString("Lenses", comment: "Ciao")
let test19 = NSLocalizedString("Rule of Thirds", comment: "Ciao")
let test20 = NSLocalizedString("Central Perspective", comment: "Ciao")
let test21 = NSLocalizedString("Light Painting", comment: "Ciao")
let test200 = NSLocalizedString("Lights2", comment: "Ciao")
let test201 = NSLocalizedString("Light Painting", comment: "Ciao")


class Challenges: ObservableObject {
    
    @Published var alltopics = [Item]()
    @Published var allchallenges = [Item]()
    
    let text:LocalizedStringKey = "Discover"
    
    
//    TOPIC

    let composition = Item(name: test1, image: "composition", active: 0, category: ["MR", "EC2"])
    let portrait = Item(name:test2, image: "portrait", active: 2, category: ["MR", "EC"])
    let photobasics = Item(name:test3, image: "photobasics", active: 2, category: ["MR", "EC"])
    let bandw = Item(name:test4, image: "bandw", active: 2, category: ["UF", "MR"])
    let macro = Item(name:test5, image: "macro", active: 2, category: ["UF", "MR"])
    let streetph = Item(name:test6, image: "streetph", active: 2, category: ["UF", "MR"])
    let architectural = Item(name:test7, image: "architectural", active: 2, category: ["UF"])
    let lights = Item(name:test8, image: "lights", active: 0, category: ["MR"])
    let lighteffects = Item(name:test200, image: "lighteffects", active: 2, category: ["MR"])
    let food = Item(name:test9, image: "food", active: 2, category: ["MR"])
    let abstract = Item(name:test10, image: "abstract", active: 2, category: ["MR"])
    let landscape = Item(name:test11, image: "landscape", active: 2, category: ["MR"])
    let colors = Item(name:test12, image: "colors", active: 2, category: ["MR"])
    let sport = Item(name:test13, image: "sport", active: 2, category: ["MR"])
    let nature = Item(name:test14, image: "nature", active: 2, category: ["MR"])
    let fashion = Item(name:test15, image: "fashion", active: 2, category: ["MR"])
    let wedding = Item(name:test16, image: "wedding", active: 2, category: ["MR"])
    let documentary = Item(name:test17, image: "documentary", active: 2, category: ["MR"])
    let lenses = Item(name:test18, image: "lenses", active: 2, category: ["MR"])
    
    
//    CHALLENGES
    
    let rulethirds = Item(name:test19, image: "rthirds", active: 0, category: ["composition"])
    let centperspect = Item(name:test20, image: "cperspective", active: 2, category: ["composition"])
    let longexposure = Item(name:test201, image: "longexposure", active: 2, category: ["lights"])
    let bokeh = Item(name:test21, image: "bokeh", active: 2, category: ["lights"])

    init() {
//        composition = Item(name: test.description, image: "composition", active: 0, category: ["MR", "EC2"])
        self.alltopics = [composition,lights,portrait,photobasics,bandw,macro,streetph,architectural,lighteffects,food,abstract,landscape,colors,sport,nature,fashion,wedding,documentary,lenses]
        self.allchallenges = [rulethirds,centperspect,longexposure,bokeh]
        

    }
    
}
