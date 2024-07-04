//
//  SecondView.swift
//  FlexLayout+TCA
//
//  Created by liam on 7/3/24.
//

import UIKit
import SwiftUI

import ComposableArchitecture

struct SecondView: View {
    let store: StoreOf<Counter>
    
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                store.send(.decrease)
            }, label: {
                Text("-")
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                    .padding()
            })
            .background(.blue)
            
            Text("\(store.count)")
            
            Button(action: {
                store.send(.increase)
            }, label: {
                Text("+")
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                    .padding()
            })
            .background(.red)
        }
    }
}

#Preview {
    SecondView(
        store: StoreOf<Counter>(
            initialState: Counter.State()) {
                Counter()
            }
    )
}
