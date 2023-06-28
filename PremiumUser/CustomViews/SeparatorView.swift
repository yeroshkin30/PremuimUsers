//
//  SeparatorView.swift
//  PremiumUser
//
//  Created by Oleg  on 27.06.2023.
//

import UIKit

class SeparatorView: UIView {

    init() {
        super.init(frame: CGRect())
        backgroundColor = UIColor.Settings.separator
        heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
