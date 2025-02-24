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
    }
    
    @Published private var route: AppRoute = .home
    
    override var view: any View {
        switch route {
        case .home:
            return VegetablesHome()
        }
    } 
}
