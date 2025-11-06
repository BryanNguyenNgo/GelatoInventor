//
//  Recipe.swift
//  Let Me Cook
//
//  Created by tinkertanker on 8/9/25.
//

import Foundation
import FoundationModels

@Generable
struct Recipe {
    @Guide(description: "Title of the gelato")
    var title: String
    
    
    @Guide(description: "A brief description of the gelato")
    var description: String
    
    @Guide(description: "A list of ingredients required for the recipe")
    var ingredients: [Ingredient]
    
    @Guide(description: "A list of steps to prepare the recipe. Keep it short and simple.", .maximumCount(40))
    var steps: [String] = []
    
    @Guide(description: "The allergies the gelato is free of, if any")
    var allergies: [Allergy]
    
    @Generable
    struct Ingredient {
        @Guide(description: "Quantity of the ingredient, like '2 cups' or '1 tablespoon'")
        var quantity: IngredientQuantity
        
        @Guide(description: "Name of ingredient, like 'flour' or 'sugar'")
        var name: String
    }

    
    
    @Generable
    struct IngredientQuantity {
        @Guide(description: "Quantity")
        var value: Int
        
        @Guide(description: "The units of measurement for the quantity, such as 'cup', 'tablespoon', 'teaspoon', etc. For ingredients like salt or pepper, use 'pinch' or 'to taste'.")
        var unit: Unit
        
        @Generable
        enum Unit: String, Codable {
            case cup = "cup"
            case tablespoon = "tablespoon"
            case teaspoon = "teaspoon"
            case gram = "gram"
            case kilogram = "kilogram"
            case milliliter = "milliliter"
            case liter = "liter"
            case ounce = "ounce"
            case pound = "pound"
            case pinch = "pinch"
            case toTaste = "to taste"
            
            var description: String {
                switch self {
                case .cup: "cup"
                case .tablespoon: "tbsp"
                case .teaspoon: "tsp"
                case .gram: "g"
                case .kilogram: "kg"
                case .milliliter: "ml"
                case .liter: "L"
                case .ounce: "oz"
                case .pound: "lb"
                case .pinch: "pinch"
                case .toTaste: "to taste"
                }
            }
        }
    }
}
