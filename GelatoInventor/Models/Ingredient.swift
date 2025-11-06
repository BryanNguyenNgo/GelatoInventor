//
//  Ingredient.swift
//  Sample Foundation Models
//
//  Created by Bryan Nguyen on 6/11/25.
//

import Foundation

struct Ingredient: Identifiable, Hashable {
    var id: String {
        name
    }
    var category: Category
    var name: String
    var emoji: String
    
    enum Category: String, CaseIterable, CustomStringConvertible {
        case flavour
        case topping
        case fruit
        
        var description: String {
            switch self {
            case .flavour: return "Flavour"
            case .topping: return "Toppings"
            case.fruit: return "Fruits"
            }
        }
    }
}
