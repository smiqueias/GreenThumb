//
//  PreviewData.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 24/02/25.
//

import Foundation

struct PreviewData {
    
    static func loadVegetables() -> [Vegetable] {
        
        guard let url = Bundle.main.url(forResource: "vegetables", withExtension: "json") else {
            return []
        }
        
        do {
            let date = try Data(contentsOf: url)
            let vegetables = try JSONDecoder().decode([Vegetable].self, from: date)
            return vegetables
        } catch {
            return []
        }
    }
}
