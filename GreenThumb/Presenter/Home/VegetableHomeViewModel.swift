//
//  VegetableHomeViewModel.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 23/02/25.
//

import Foundation

@MainActor
final class VegetableHomeViewModel : ObservableObject {
    
    private let vegetableHomeWorker: VegetablesWorker
    
    @Published var vegetables: [Vegetable] = []
    @Published var vegetablesState: BehaviorState = BehaviorState.idle
    
    init(vegetableHomeWorker: VegetablesWorker) {
        self.vegetableHomeWorker = vegetableHomeWorker
    }
    
    
    func fetchVegetables() async {
        
        
        self.vegetablesState = .loading
        await vegetableHomeWorker.fetchVegeatbles {
             result in switch result {
            case let .success(vegetables):
                 DispatchQueue.main.async {
                     self.vegetables = vegetables
                     self.vegetablesState = .loaded
                 }
            case let .failure(error):
                 self.vegetablesState = .error(errorMessage: error.localizedDescription)
             }
        }
        
        self.vegetablesState = BehaviorState.loaded
    }
    
}
