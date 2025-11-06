//
//  Allergy.swift
//  GelatoInventor
//
//  Created by Bryan Nguyen on 7/11/25.
//

import Foundation
import FoundationModels

@Generable()
struct Allergy: Identifiable, Hashable{
    var id: String {
        name
    }
    var name: String
    var emoji: String
    
    static let peanuts = Allergy(name: "Peanuts", emoji: "🥜")
    static let dairy = Allergy(name: "Dairy", emoji: "🥛")
    static let gluten = Allergy(name: "Gluten", emoji: "🍞")
    static let eggs = Allergy(name: "Eggs", emoji: "🥚")
    
    static let allAllergies: [Allergy] = [
        .peanuts, .dairy, .gluten, .eggs
    ]
    
}
