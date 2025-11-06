//
//  AllergiesPickerView.swift
//  GelatoInventor
//
//  Created by Bryan Nguyen on 7/11/25.
//

import SwiftUI

struct AllergiesPickerView: View {
    
    @Binding var selectedAllergies: [Allergy]
    
    var body: some View {
                Text("Allergies: ")
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.top)
        Divider()
        
        FlowLayout {
            ForEach(Allergy.allAllergies) { allergy in
                Button {
                    withAnimation {
                        if selectedAllergies.contains(allergy) {
                            selectedAllergies.removeAll { $0.id == allergy.id }
                        } else {
                            selectedAllergies.append(allergy)
                        }
                    }
                } label: {
                    Text("\(allergy.emoji) \(allergy.name)")
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                        .foregroundStyle(selectedAllergies.contains(allergy) ? Color(.systemBackground) : Color.primary)
                        .glassEffect(.regular.tint(selectedAllergies.contains(allergy) ? .blue : nil),
                                     in: .capsule)
                }
                .buttonStyle(.plain)
                
            }
        }
        .padding(.horizontal)
    }
}
