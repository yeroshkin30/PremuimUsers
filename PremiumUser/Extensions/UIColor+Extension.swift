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

    enum MainScreen {
        static let settingsButton = UIColor(red: 219/255, green: 35/255, blue: 167/255, alpha: 1)
        static let settingsShadow = UIColor(red: 31/255, green: 27/255, blue: 27/255, alpha: 0.75)
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

    static var navBarGradient: CAGradientLayer {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor.Settings.lightBlue.withAlphaComponent(0.3).cgColor,
            UIColor.Settings.darkBlue.withAlphaComponent(0.3).cgColor
        ]

        return layer
    }

}
