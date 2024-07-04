//
//  MainView.swift
//  FlexLayout+TCA
//
//  Created by liam on 7/3/24.
//

import UIKit
import SwiftUI

import ComposableArchitecture

final class MainViewController: UIHostingController<MainView> {
    init(
        navigationController: UINavigationController
    ) {
        super.init(rootView: .init(
            navigationController: navigationController
        ))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct MainView: View {
    let navigationController: UINavigationController
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                navigationController
                    .pushViewController(
                        CounterViewController(
                            view: CounterView(),
                            store: StoreOf<Counter>(initialState: Counter.State()) {
                                Counter()
                        }),
                        animated: true
                    )
            }, label: {
                Text("UIKit + TCA")
                    .padding()
            })
            .background(.red)
            
            Button(action: {
                navigationController
                    .pushViewController(
                        SecondViewController(rootView: SecondView(store: StoreOf<Counter>(initialState: Counter.State()) {
                            Counter()
                    })),
                        animated: true
                    )
            }, label: {
                Text("SWiftUI + TCA")
                    .padding()
            })
            .background(.red)
        }
    }
    
}

#Preview {
    MainView(navigationController: UINavigationController())
}
