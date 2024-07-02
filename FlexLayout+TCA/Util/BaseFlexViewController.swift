//
//  BaseFlexViewController.swift
//
//  Created by HyunJin on 2022/04/14.
//  Copyright © 2022 MVL. All rights reserved.
//

import UIKit


public protocol AnyFlexViewController: UIViewController {}

open class BaseFlexViewController<View: UIView>: UIViewController {

    public let body: View

    public init(view: View) {
        self.body = view
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func loadView() {
        view = body
    }
}

extension BaseFlexViewController: AnyFlexViewController {}

