//
//  ContentView.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 23/02/25.
//

import SwiftUI

struct VegetableListScreen: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            Task {
               await VegetablesWorker(vegetablesRepository: VegetablesRepository(), decoder: JSONDecoder())
                    .fetchVegeatbles {
                        result in switch result {
                        case let .success(vegetables):
                            print(vegetables.first ?? "Nenhum vegetal")
                        case let .failure(error):
                            print(error)
                        }
                    }
            }
           
        }
    }
}

//#Preview {
//    VegetableListScreen()
//}
