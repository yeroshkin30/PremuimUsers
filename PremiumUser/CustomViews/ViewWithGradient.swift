//
//  ViewWithGradient.swift
//  PremiumUser
//
//  Created by Oleg  on 28.06.2023.
//

import UIKit

final class ViewWithGradient: UIView {
    private let gradientLayer: CAGradientLayer

    init(with gradient: CAGradientLayer) {
        self.gradientLayer = gradient
        super.init(frame: CGRect())

        gradientLayer.cornerRadius = 20
        layer.addSublayer(gradientLayer)
        addShadows()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        gradientLayer.frame = bounds
    }
}
