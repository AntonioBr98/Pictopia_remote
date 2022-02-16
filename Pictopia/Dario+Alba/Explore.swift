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

class ExploreItems: ObservableObject {
    
    @Published var exploreitems = [ExpItem]()
    
    let mostrecents = ExpItem(name:"Most Recents", tag: "MR")
    let userfavorites = ExpItem(name:"User Favourites", tag: "UF")
    let editorchoices = ExpItem(name:"Editor Choiches", tag: "EC")

    init() {

        self.exploreitems = [mostrecents, userfavorites, editorchoices]

    }
    
}
