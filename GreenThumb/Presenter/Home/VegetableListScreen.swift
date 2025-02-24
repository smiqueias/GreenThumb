//
//  ContentView.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 23/02/25.
//

import SwiftUI

struct VegetableListScreen: View {
    
    @StateObject private var viewModel = VegetableHomeViewModel(
        vegetableHomeWorker: VegetablesWorker(vegetablesRepository: VegetablesRepository.shared, decoder: JSONDecoder())
    )
    
    var body: some View {
        NavigationWrapper {
            VStack {
                switch viewModel.vegetablesState {
                case .loading, .idle:
                    ProgressView()
                        .scaleEffect(2.0, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                case .error(errorMessage: let error):
                    Text(error)
                default:
                    if !viewModel.vegetables.isEmpty {
                        List(viewModel.vegetables, id: \.vegetableID) {
                            vegetables in VegetableCellView(vegetable: vegetables)
                        }
                        .listStyle(.plain)
                    } else {
                        Text("Nenhum vegetal encontrado")
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchVegetables()
                }
            }.navigationTitle(Text("Vegetais"))
        }
    }
}

#Preview {
    NavigationWrapper {
        VegetableListScreen()
    }
}
