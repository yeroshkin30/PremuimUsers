//
//  NavigationController+Extension.swift
//  PremiumUser
//
//  Created by Oleg  on 28.06.2023.
//

import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()

        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if viewControllers.first == topViewController {
           return false
        }

        return true
    }
}
