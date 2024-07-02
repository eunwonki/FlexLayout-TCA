//
//  CounterViewController.swift
//  FlexLayout+TCA
//
//  Created by liam on 7/2/24.
//

import UIKit
import Combine

import ComposableArchitecture

final class CounterViewController: BaseFlexViewController<CounterView> {
    
    private var cancellables = Set<AnyCancellable>()
    
    init(view: CounterView, store: StoreOf<Counter>) {
        super.init(view: view)
        bind(to: store)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func bind(to store: StoreOf<Counter>) {
        store.publisher
            .map { String($0.count) }
            .assign(to: \.text, on: body.counterLabel)
            .store(in: &cancellables)
        
        body.increaseButton
            .throttleTapPublisher()
            .sink { _ in store.send(.increase) }
            .store(in: &cancellables)
        
        body.decreaseButton
            .throttleTapPublisher()
            .sink { _ in store.send(.decrease) }
            .store(in: &cancellables)
    }
}

