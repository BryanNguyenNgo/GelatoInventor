//
//  AllergyBadgeView.swift
//  GelatoInventor
//
//  Created by Bryan Nguyen on 7/11/25.
//
import SwiftUI

struct AllergyBadgeView: View {
    
    var allergies: [Allergy.PartiallyGenerated?]  // accept optional allergies
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Allergies")
                .font(.headline)
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 4) {
                ForEach(allergies.compactMap { $0 }) { allergy in
                    // unwraps properties safely
                    let name = allergy.name
                    let emoji = allergy.emoji
                    
                    HStack {
                        Text(emoji ?? "")
                        Text(name ?? "")
                    }
                    .padding(6)
                    .background(Color.red.opacity(0.15))
                    .cornerRadius(8)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
    }
}


