//
//  NavigationWrapper.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 24/02/25.
//

import SwiftUI

struct NavigationWrapper<Content: View>: View {
    var content: Content
    
    var body: some View {
        NavigationStack {
            content
        }
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
}
