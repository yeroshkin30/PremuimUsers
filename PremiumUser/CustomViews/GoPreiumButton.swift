//
//  GoPreiumButton.swift
//  PremiumUser
//
//  Created by Oleg  on 26.06.2023.
//

import UIKit

class GoPremiumButton: UIButton {
    private let diamondView: UIImageView = .init(image: UIImage(named: "diamond"))

    init() {
        super.init(frame: CGRect())
        setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupButton() {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString(
            "Go Premium",
            attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: "Roboto Medium", size: 22)!])
        )
        config.titleAlignment = .center
        config.baseForegroundColor = .white
        config.background.backgroundColor = .clear
        config.background.customView = ViewWithGradient(with: .premiumGradient)
        config.cornerStyle = .capsule

        configuration = config

        //imagesetup
        addSubview(diamondView)
        diamondView.contentMode = .scaleAspectFit
        diamondView.backgroundColor = .clear
        diamondView.layout {
            $0.height == heightAnchor
            $0.leading == leadingAnchor + 15
        }

        addShadows()
    }
}
