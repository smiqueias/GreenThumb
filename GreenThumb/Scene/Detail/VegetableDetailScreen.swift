//
//  VegetableDetailScreen.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 24/02/25.
//

import SwiftUI

struct VegetableDetailScreen: View {
    
    let vegetable: Vegetable
    
    var body: some View {
        
        let pests: [Pest] = vegetable.pests
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 16) {
                
                VegetableImage(vegetable: vegetable, kind: .detail)
                
                Text(vegetable.name)
                    .font(.title)
                
                Divider()
                
                Text("Fatos importantes")
                    .font(.title2)
                    .fontWeight(.bold)
                
                DetailRow(icon: "leaf", title: "Profundidade da semente", value: vegetable.seedDepth)
                DetailRow(icon: "thermometer", title: "Temperatura de germinação", value: vegetable.germinationSoilTemp)
                DetailRow(icon: "calendar", title: "Dias para a germinação", value: "\(vegetable.daysToGermination) dias")
                DetailRow(icon: "sun.max", title: "Necessidade de luz", value: vegetable.light)
                DetailRow(icon: "drop", title: "Rega", value: vegetable.watering)
                DetailRow(icon: "leaf.arrow.triangle.circlepath", title: "Companheiras", value: vegetable.goodCompanions)
                DetailRow(icon: "exclamationmark.triangle", title: "Más Companheiras", value: vegetable.badCompanions)
                DetailRow(icon: "heart.fill", title: "Benefícios para a saúde", value: vegetable.healthBenefits.isEmpty ? "N/A" : vegetable.healthBenefits)
                
                if !pests.isEmpty {
                    DetailRow(icon: "ladybug", title: "Pragas", value: pests.isEmpty ? "N/A": pests.map { $0.name}.joined(separator: ", "))
                }
                Divider()
                
                SectionHeader(title: "Dicas de cultivo")
                Text(vegetable.growingDescription)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                SectionHeader(title: "Dicas para a colheita")
                Text(vegetable.harvestDescription)
                    .font(.body)
                    .foregroundColor(.secondary)
                
     
            }.frame(alignment: .center)
            
        }.padding()
        
        
    }
}

private struct SectionHeader: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.primary)
            .padding(.top)
    }
}

private struct DetailRow: View {
    
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .foregroundColor(.green)
                .frame(width: 24, height: 24)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.body)
                    .foregroundColor(.primary)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    VegetableDetailScreen(vegetable: PreviewData.loadVegetables()[0])
}
