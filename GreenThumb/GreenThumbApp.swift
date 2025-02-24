//
//  GreenThumbApp.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 23/02/25.
//

import SwiftUI

@main
struct GreenThumbApp: App {
    
    @ObservedObject var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.currentView.environmentObject(appCoordinator)
        }
    }
}
