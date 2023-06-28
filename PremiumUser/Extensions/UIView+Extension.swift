//
//  UIView+Extension.swift
//  PremiumUser
//
//  Created by Oleg  on 26.06.2023.
//

import UIKit

extension UIView {
    func addShadows() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 6)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.8
        layer.cornerRadius = 20
    }
}
