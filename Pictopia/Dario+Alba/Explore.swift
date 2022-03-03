//
//  Explore.swift
//  Pictopia
//
//  Created by Dario Vigilante on 16/02/22.
//

import Foundation
import SwiftUI

struct ExpItem: Identifiable {
    let id = UUID()
    let name: String
    let tag: String
}


let test22 = NSLocalizedString("Most Recents", comment: "Ciao")
let test23 = NSLocalizedString("User Favourites", comment: "Ciao")
let test24 = NSLocalizedString("Editor Choiches", comment: "Ciao")

class ExploreItems: ObservableObject {
    
    @Published var exploreitems = [ExpItem]()
    
    let mostrecents = ExpItem(name:test22, tag: "MR")
    let userfavorites = ExpItem(name:test23, tag: "UF")
    let editorchoices = ExpItem(name:test24, tag: "EC")

    init() {

        self.exploreitems = [mostrecents, userfavorites, editorchoices]

    }
    
}
