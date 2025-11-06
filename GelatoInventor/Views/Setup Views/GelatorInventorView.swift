//
//  GelatorInventorView.swift
//  GelatorInventor
//
//  Created by Bryan Nguyen on 6/11/25.
//

import SwiftUI

// the homepage where users can pick what kind of gelato they want
struct GelatoInventorView: View {
    
    @State private var ingredientCategory: Ingredient.Category = .flavour
    @State private var selectedIngredients: [Ingredient] = []
    @State private var selectedAllergies: [Allergy] = []
    
    @State private var taste = ""
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(alignment: .leading) {
                        TextField("What kind of gelato do you want?", text: $taste)
                            .padding()
                            .glassEffect(.regular, in: .capsule)
                            .padding(.horizontal)
                        // 3 type of customisations they can make to customise their gelato
                        IngredientsPickerView(selectedIngredients: $selectedIngredients)
                        AllergiesPickerView(selectedAllergies: $selectedAllergies)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 80)
                }
                
                // goes to this page after pressing generate button
                NavigationLink {
                    GelatoPreviewView(taste: taste, ingredients: selectedIngredients, allergies: selectedAllergies)
                } label: {
                    HStack {
                        Image(systemName: "sparkles")
                            .font(.headline)
                        VStack(alignment: .leading) {
                            Text("Generate")
                                .font(.headline)
                            Text("\($selectedIngredients.count) ingredients selected")
                                .contentTransition(.numericText(value: Double(selectedIngredients.count)))
                                .font(.caption)
                                .monospacedDigit()
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .disabled(selectedIngredients.isEmpty)
                .glassEffect()
                .padding()
            }
            .ignoresSafeArea(.container, edges: .bottom)
            .navigationTitle("New Gelato")
        }
    }
}

#Preview {
    GelatoInventorView()
}
// show ingredients in ingredientspicker
struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    var alignment: HorizontalAlignment = .leading
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        var width: CGFloat = 0
        var height: CGFloat = 0
        var currentRowWidth: CGFloat = 0
        var currentRowHeight: CGFloat = 0
        
        let maxWidth = proposal.width ?? .infinity
        
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            
            if currentRowWidth + size.width > maxWidth {
                width = max(width, currentRowWidth)
                height += currentRowHeight + spacing
                currentRowWidth = size.width
                currentRowHeight = size.height
            } else {
                currentRowWidth += size.width + (currentRowWidth > 0 ? spacing : 0)
                currentRowHeight = max(currentRowHeight, size.height)
            }
        }
        
        width = max(width, currentRowWidth)
        height += currentRowHeight
        
        return CGSize(width: width, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var x: CGFloat = bounds.minX
        var y: CGFloat = bounds.minY
        var currentRowHeight: CGFloat = 0
        
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            
            if x + size.width > bounds.maxX {
                x = bounds.minX
                y += currentRowHeight + spacing
                currentRowHeight = 0
            }
            
            subview.place(
                at: CGPoint(x: x, y: y),
                proposal: ProposedViewSize(size)
            )
            
            x += size.width + spacing
            currentRowHeight = max(currentRowHeight, size.height)
        }
    }
}
