//
//  BaseCoordinator.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 24/02/25.
//

import SwiftUI

open class BaseCoordinator<Route> : ObservableObject {
    
   open var view: any View {
        fatalError("Subclasses must implement view")
    }
    
    public var currentView: AnyView {
        AnyView(view)
    }
    
}

protocol Route: Hashable, Equatable {}

final class Router<Route> : ObservableObject {
    
    @Published public var path: [Route] = []
    
    public init() {}
    
    public func push(_ routes: Route...) {
        path.append(contentsOf: routes)
    }
    
    public func pop() {
        path.removeLast()
    }
    
}
