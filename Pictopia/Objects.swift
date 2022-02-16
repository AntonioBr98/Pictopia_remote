//
//  Objects.swift
//  Pictopia
//
//  Created by Dario Vigilante on 15/02/22.
//

import Foundation
import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let level: Int
    let category: [String]
}
