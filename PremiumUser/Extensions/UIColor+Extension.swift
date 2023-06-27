//
//  UIColor+Extension.swift
//  PremiumUser
//
//  Created by Oleg  on 26.06.2023.
//

import UIKit

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
        layer.colors = [
            UIColor.Settings.goPremium.withAlphaComponent(0.75).cgColor,
            UIColor.Settings.goPremiumLight.withAlphaComponent(0.75).cgColor
        ]

        return layer
    }

    static var tableGradient: CAGradientLayer {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor.Settings.lightBlue.withAlphaComponent(0.65).cgColor,
            UIColor.Settings.darkBlue.withAlphaComponent(0.65).cgColor
        ]

        return layer
    }
}
