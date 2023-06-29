//
//  UIColor+Extension.swift
//  PremiumUser
//
//  Created by Oleg  on 26.06.2023.
//

import UIKit

extension CAGradientLayer {
    static var premiumGradient: CAGradientLayer {
        let layer = CAGradientLayer()

        layer.colors = [
            R.color.goPremium()!.withAlphaComponent(0.75).cgColor,
            R.color.goPremiumLight()!.withAlphaComponent(0.75).cgColor
        ]

        return layer
    }

    static var tableGradient: CAGradientLayer {
        let layer = CAGradientLayer()
        layer.colors = [
            R.color.lightBlue()!.withAlphaComponent(0.65).cgColor,
            R.color.darkBlue()!.withAlphaComponent(0.65).cgColor
        ]

        return layer
    }

    static var navBarGradient: CAGradientLayer {
        let layer = CAGradientLayer()
        layer.colors = [
            R.color.lightBlue()!.withAlphaComponent(0.3).cgColor,
            R.color.darkBlue()!.withAlphaComponent(0.3).cgColor
        ]

        return layer
    }

}
