//
//  StepsView.swift
//  Sample Foundation Models
//
//  Created by Jia Chen Yee on 7/21/25.
//

import SwiftUI
import FoundationModels

struct StepsView: View {
    
    var steps: [String.PartiallyGenerated]
    
    var body: some View {
        Text("Steps")
            .padding(.horizontal)
            .font(.headline)
        
        VStack(alignment: .leading) {
            ForEach(steps.indices, id: \.self) { stepIndex in
                Label(steps[stepIndex], systemImage: "\(stepIndex + 1).circle")
                if stepIndex < steps.count - 1 {
                    Divider()
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .glassEffect(.regular, in: .rect(cornerRadius: 32))
        .padding(.horizontal)
    }
}
