//
//  GelatoPreview.swift
//  GelatorInventor
//
//  Created by Bryan Nguyen on 6/11/25.
//

import SwiftUI
import FoundationModels

// where user can see their created gelato after picking ingredients and taste
struct GelatoPreviewView: View {
    
    var taste: String
    var ingredients: [Ingredient]
    var allergies: [Allergy]
    
    @State private var recipe: Recipe.PartiallyGenerated?
    
    var body: some View {
        Group {
            if let recipe {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text(recipe.title ?? "")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        if let description = recipe.description {
                            Text(description)
                                .foregroundStyle(.secondary)
                                .padding(.horizontal)
                                .padding(.bottom)
                        }
                        
                        if let ingredients = recipe.ingredients, !ingredients.isEmpty {
                            IngredientsView(ingredients: ingredients)
                        }
                        
                        if let steps = recipe.steps, !steps.isEmpty {
                            StepsView(steps: steps)
                        }
                        if let allergies = recipe.allergies, !allergies.isEmpty {
                           AllergyBadgeView(allergies: allergies)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } else {
                ProgressView()
            }
        }
        .task {
            let instructions = """
        You are a gelato inventor. The user will provide you with a prompt describing what they have and what kind of recipe they want, such as
        
        I have
        - chocolate
        - sprinkles
        - apple
        
        I would like to make a new gelato with this ingredients
        And I want my gelato to be: like eating a wacky, sweet gelato
        I am allergic to peanuts so please do not include them in the recipe
        
        The response should include the name of the recipe, a brief description, and a list of ingredients.
        
        For example:
        Recipe: Matcha Green Tea Delight
        Description: A creamy and earthy gelato infused with the subtle, vibrant flavors of premium green tea.
        Ingredients:
        - 1 chocolate bar
        - 1 cup of sprinkles
        - 1 apple
        
        Do not use this example directly, but use it as a guide to format your response.
        
        You do not need to use all the ingredients provided, but those are the ingredients the user currently has available.
        """
            
            let session = LanguageModelSession(instructions: instructions)
            
            
            let prompt = """
                        I have
                        \(ingredients.map { "- \($0.name)" }.joined(separator: "\n"))
                        
                        And I want my gelato to be: \(taste)
                        And I am allergic to \(allergies)
                    """
            do {
                let response = try await session.respond(to: prompt, generating: Recipe.self)
                recipe = response.content.asPartiallyGenerated()
            }catch {
                print(error.localizedDescription)
            }
            
            
        }
    }
}
