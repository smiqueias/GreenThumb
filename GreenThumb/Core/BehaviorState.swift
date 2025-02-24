//
//  BehaviorState.swift
//  GreenThumb
//
//  Created by Saulo Nascimento on 23/02/25.
//

enum BehaviorState {
    case idle
    case loading
    case loaded
    case error(errorMessage: String)
}
