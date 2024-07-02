//
//  BaseFlexView.swift
//  FlexLayout+TCA
//
//  Created by liam on 7/2/24.
//

import UIKit

import KarrotFlex

public protocol FlexLayoutable: AnyObject {
    func setNeedsLayout()
    func layoutIfNeeded()
}

open class BaseFlexView: UIView, FlexLayoutable {
    public init() {
        super.init(frame: .zero)
        localize()
        setupFlexLayout()
    }

    private var isRootView: Bool {
        superview?.isFlexEnabled == false
    }

    public var rootFlexView: UIView? {
        var view: UIView?
        while view?.isFlexEnabled == true {
            view = view?.superview
        }
        return view
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setupFlexLayout() {}
    open func localize() {}

    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        flex.sizeThatFits(size: size)
    }
}
