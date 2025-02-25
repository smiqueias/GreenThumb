//
//  VegetableImage.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 24/02/25.
//

import SwiftUI

struct VegetableImage: View {
    
    enum VegetableImageKind {
        case detail
        case list
    }
    
    let vegetable: Vegetable
    let kind: VegetableImageKind
    
    var body: some View {
        switch kind {
            case .detail:
                VegetableImageDetail(vegetable: vegetable)
            case .list:
                VegetableImageList(vegetable: vegetable)
        }
    }
}

private struct VegetableImageDetail: View {
    
    let vegetable: Vegetable
    
    var body: some View {
        AsyncImage(url: URL(string: vegetable.thumbnailImage)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(16)
                                .shadow(radius: 10)
                        } placeholder: {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 200)
                                .overlay(
                                    ProgressView()
                                        .scaleEffect(1.5)
                                        .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                                )
                        }
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .padding(.bottom, 8)
    }
}

private struct VegetableImageList: View {
    
    let vegetable: Vegetable
    
    var body: some View {
        AsyncImage(url: URL(string: vegetable.thumbnailImage)) { image in
            ZStack {
                // Gradient Background
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.green.opacity(0.3), Color.blue.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 85, height: 85) // Slightly larger than the image
                    .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)
                
                // Image
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
            }
        } placeholder: {
            ZStack {
                // Gradient Placeholder Background
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.1)]),
                            center: .center,
                            startRadius: 10,
                            endRadius: 40
                        )
                    )
                    .frame(width: 85, height: 85)
                    .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)
                
                ProgressView()
                    .scaleEffect(1.2)
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            }
        }
    }
}

//#Preview {
//    VegetableImage(vegetable: PreviewData.loadVegetables()[0])
//}
