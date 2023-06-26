//
//  ViewController+Background.swift
//  PremiumUser
//
//  Created by Oleg  on 26.06.2023.
//

import UIKit

extension UIViewController {
    func setCustomBackground() {
        let background = UIImageView(image: UIImage(named: "background"))
        background.frame = view.bounds
        view.insertSubview(background, at: 0)
    }
}
