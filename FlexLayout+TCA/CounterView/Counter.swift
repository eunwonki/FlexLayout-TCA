//
//  Counter.swift
//  FlexLayout+TCA
//
//  Created by liam on 7/2/24.
//

import Foundation
import Combine

import ComposableArchitecture

@Reducer
final class Counter: ObservableObject {
    @Published private(set) var state = State()
    
    init() {}
    
    @ObservableState
    struct State: Equatable {
        var count: Int = 0
    }
    
    enum Action {
        case increase
        case decrease
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .increase:
                state.count += 1
                return .none
                
            case .decrease:
                state.count -= 1
                return .none
            }
        }
    }
}
