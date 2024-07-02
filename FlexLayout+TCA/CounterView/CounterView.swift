//
//  CounterView.swift
//  FlexLayout+TCA
//
//  Created by liam on 7/2/24.
//

import UIKit

import KarrotFlex

final class CounterView: BaseFlexView {
    
    let increaseButton = UIButton().then {
        $0.setTitle("+", for: .normal)
        $0.backgroundColor = .red
    }
    
    let decreaseButton = UIButton().then {
        $0.setTitle("-", for: .normal)
        $0.backgroundColor = .blue
    }
    
    let counterLabel = UILabel().then {
        $0.text = "0"
        $0.font = .systemFont(ofSize: 50)
        $0.textAlignment = .center
    }
    
    override init() {
        super.init()
        backgroundColor = .brown
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        flex.layout()
    }
    
    override func setupFlexLayout() {
        flex.define {
            FlexHStack($0) {
                FlexItem($0, view: self.decreaseButton)
                    .size(50)
                FlexItem($0, view: self.counterLabel)
                    .grow(1)
                FlexItem($0, view: self.increaseButton)
                    .size(50)
            }
            .padding(10)
            .width(80%)
        }
        .alignItems(.center)
        .justifyContent(.center)
        .width(100%)
        .height(100%)
        .basis(1)
    }
}
