//
//  IngredientsView.swift
//  Sample Foundation Models
//
//  Created by Jia Chen Yee on 7/21/25.
//


import SwiftUI

struct IngredientsView: View {
    
    var ingredients: [Recipe.Ingredient.PartiallyGenerated]
    
    var body: some View {
        Text("Ingredients")
            .padding(.horizontal)
            .font(.headline)
        VStack(alignment: .leading) {
            ForEach(ingredients) { ingredient in
                if let quantity = ingredient.quantity,
                   let name = ingredient.name {
                    
                    let quantityDescription: String = {
                        if quantity.unit == .toTaste || quantity.unit == .pinch {
                            return ""
                        } else {
                            return "\(quantity.value ?? 0) \(quantity.unit?.description ?? "")"
                        }
                    }()
                    
                    let description: String = {
                        switch quantity.unit {
                        case .toTaste:
                            return "\(name) to taste"
                        case .pinch:
                            return "A pinch of \(name)"
                        default:
                            return "\(name)"
                        }
                    }()
                    
                    HStack {
                        Text(quantityDescription)
                            .foregroundStyle(.secondary)
                            .frame(width: 50, alignment: .trailing)
                        Text(description)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .glassEffect(.regular, in: .rect(cornerRadius: 32))
        .padding(.horizontal)
        .padding(.bottom)
    }
}
