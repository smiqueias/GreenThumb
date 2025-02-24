//
//  VegetablesHome.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 24/02/25.
//

import SwiftUI

struct VegetablesHome: View {
    var body: some View {
        NavigationWrapper {
            TabView {
                VegetableListScreen()
                    .tabItem {
                        Image(systemName: "leaf")
                        Text("Vegetais")
                    }
                
                Text("Meu Jardim")
                    .tabItem {
                        Image(systemName: "house")
                        Text("Meu Jardim")
                    }
                
                Text("Pragas")
                    .tabItem {
                        Image(systemName: "ladybug")
                        Text("Pragas")
                    }
                
            }
        }
    }
}

#Preview {
    NavigationWrapper {
        VegetablesHome()
    }
}
