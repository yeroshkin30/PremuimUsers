//
//  GoPreiumButton.swift
//  PremiumUser
//
//  Created by Oleg  on 26.06.2023.
//

import UIKit

class GoPremiumButton: UIButton {

    init() {
        super.init(frame: CGRect())
        setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupButton() {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "diamond")
        config.imagePlacement = .leading
        config.imagePadding = 30
        config.attributedTitle = AttributedString(
            "Go Premium",
            attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: "Roboto Medium", size: 22)!])
        )
        config.titleAlignment = .center
        config.baseForegroundColor = .white
        config.background.backgroundColor = .clear
        config.background.customView = ViewWithGradient(with: .premiumGradient)
        config.contentInsets =  NSDirectionalEdgeInsets(top: 0, leading: -config.imagePadding, bottom: 0, trailing: config.imagePadding)
        config.cornerStyle = .capsule

        configuration = config

        addShadows()
    }
}
