//
//  SettingsButton.swift
//  PremiumUser
//
//  Created by Oleg  on 27.06.2023.
//

import UIKit

class SettingsButton: UIButton {

    init() {
        super.init(frame: CGRect())
        setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupButton() {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.MainScreen.settingsShadow
        shadow.shadowOffset = CGSize(width: 0, height: 2)
        shadow.shadowBlurRadius = 5

        let fontAttributes: [NSAttributedString.Key : Any] =  [
            NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 22)!,
            NSAttributedString.Key.strokeColor: UIColor.black.withAlphaComponent(1),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeWidth: -1,
            NSAttributedString.Key.shadow: shadow

        ]

        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString(
            "SETTINGS",
            attributes: AttributeContainer(fontAttributes)
        )
        config.background.backgroundColor = .MainScreen.settingsButton
        config.cornerStyle = .capsule
        configuration = config

        addShadows()
    }
}
