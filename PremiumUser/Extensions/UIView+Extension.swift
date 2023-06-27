//
//  UIView+Extension.swift
//  PremiumUser
//
//  Created by Oleg  on 26.06.2023.
//

import UIKit

class ViewWithGradient: UIView {
    let gradientLayer: CAGradientLayer

    init(with gradient: CAGradientLayer) {
        self.gradientLayer = gradient
        gradientLayer.cornerRadius = 20
        super.init(frame: CGRect())
        layer.addSublayer(gradientLayer)
        layer.shadowColor = UIColor.black.cgColor

        layer.shadowOffset = CGSize(width: 5, height: 6)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.8
        layer.cornerRadius = 20
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        gradientLayer.frame = bounds
    }
}
