//
//  MainScreen.swift
//  PremiumUser
//
//  Created by oleg on 25.06.2023.
//

import UIKit

class MainViewController: UIViewController {
    private let settingsButton: UIButton = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        view.backgroundColor = .white
        view.addSubview(settingsButton)

        setupSettingsButton()
        setupConstraints()
    }

    private func setupSettingsButton() {
        var config = UIButton.Configuration.plain()
        config.title = "SETTINGS"
        config.baseForegroundColor = .white
        config.background.backgroundColor = .purple
        config.cornerStyle = .capsule
        settingsButton.configuration = config

        settingsButton.addAction(
            UIAction { _ in
                let settingsVC = SettingsViewController()
                self.show(settingsVC, sender: nil)
            },
            for: .touchUpInside
        )
    }

    private func setupConstraints() {
        settingsButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            settingsButton.widthAnchor.constraint(equalToConstant: 230),
            settingsButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
