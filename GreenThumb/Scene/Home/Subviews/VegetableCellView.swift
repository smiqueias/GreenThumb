//
//  VegetableCellView.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 24/02/25.
//

import SwiftUI

struct VegetableCellView: View {
    
    let vegetable: Vegetable
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            // Vegetable Thumbnail Image
            VegetableImage(vegetable: vegetable, kind: .list)
            // Vegetable Details
            VStack(alignment: .leading, spacing: 4) {
                Text(vegetable.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(vegetable.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2) // Limit to 2 lines for cleaner appearance
            }
        }
    }
}

//#Preview {
//    VegetableCellView(vegetable: PreviewData.loadVegetables()[0])
//}
