//
//  UIColor+Extension.swift
//  PremiumUser
//
//  Created by Oleg  on 26.06.2023.
//

import UIKit

class ViewWithGradient: UIView {
    let gradientLayer: CAGradientLayer

    init(with gradient: CAGradientLayer) {
        self.gradientLayer = gradient
        super.init(frame: CGRect())
        layer.addSublayer(gradientLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        gradientLayer.frame = bounds
    }
}



extension UIColor {
    enum Settings {
        static let separator = UIColor(named: "SeparatorColor")
        static let lightBlue = UIColor(named: "LightBlue")!
        static let darkBlue = UIColor(named: "DarkBlue")!
        static let goPremium = UIColor(named: "goPremium")!
        static let goPremiumLight = UIColor(named: "goPremiumLight")!
    }
}

extension CAGradientLayer {
    static var premiumGradient: CAGradientLayer {
        let layer = CAGradientLayer()
        layer.colors = [ UIColor.Settings.goPremiumLight, UIColor.Settings.goPremium]

        return layer
    }

    static var tableGradient: CAGradientLayer {
        let layer = CAGradientLayer()
        layer.colors = [ UIColor.Settings.lightBlue, UIColor.Settings.darkBlue]

        return layer
    }
}
