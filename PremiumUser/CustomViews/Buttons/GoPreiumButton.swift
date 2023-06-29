//
//  GoPreiumButton.swift
//  PremiumUser
//
//  Created by Oleg  on 26.06.2023.
//

import UIKit

final class GoPremiumButton: UIButton {
    private let diamondView: UIImageView =  {
        let imageView = UIImageView(image: UIImage(named: "diamond"))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear

        return imageView
    }()

    // MARK: - Initializers

    init() {
        super.init(frame: CGRect())
        setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

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

        diamondView.layout(in: self) {
            $0.height == heightAnchor
            $0.leading == leadingAnchor + 15
        }

        addShadows()
    }

    func setupImage() {


    }
}
