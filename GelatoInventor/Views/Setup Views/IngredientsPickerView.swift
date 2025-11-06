//
//  IngredientsPickerView.swift
//  Sample Foundation Models
//
//  Created by Jia Chen Yee on 7/21/25.
//

import SwiftUI

struct IngredientsPickerView: View {
    
    @State private var ingredientCategory: Ingredient.Category = .flavour
    @Binding var selectedIngredients: [Ingredient]
    
    var body: some View {
        Text("What ingredients do you have?")
            .font(.headline)
            .padding(.horizontal)
            .padding(.top)
        Picker("Ingredient Category", selection: $ingredientCategory) {
            ForEach(Ingredient.Category.allCases, id: \.self) { category in
                Text(category.description)
                    .tag(category)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
        
        FlowLayout {
            ForEach(Ingredient.allIngredients) { ingredient in
                if ingredient.category == ingredientCategory {
                    Button {
                        withAnimation {
                            if selectedIngredients.contains(ingredient) {
                                selectedIngredients.removeAll { $0.id == ingredient.id }
                            } else {
                                selectedIngredients.append(ingredient)
                            }
                        }
                    } label: {
                        Text("\(ingredient.emoji) \(ingredient.name)")
                            .padding(.vertical, 8)
                            .padding(.horizontal)
                            .foregroundStyle(selectedIngredients.contains(ingredient) ? Color(.systemBackground) : Color.primary)
                            .glassEffect(.regular.tint(selectedIngredients.contains(ingredient) ? .blue : nil),
                                         in: .capsule)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(.horizontal)
    }
}
