//
//  AppCoordinator.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 24/02/25.
//

import SwiftUI

class AppCoordinator: BaseCoordinator<Route> {
    
    enum AppRoute {
        case home
        case vegetableDetail(Vegetable)
    }
    
    @Published private var route: AppRoute = .home
    
    override var view: any View {
        switch route {
        case .home:
            return VegetablesHome()
        case let .vegetableDetail(vetegable):
            return VegetableDetailScreen(vegetable: vetegable)
        }
    } 
}
