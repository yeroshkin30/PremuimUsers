//
//  MainScreen.swift
//  PremiumUser
//
//  Created by oleg on 25.06.2023.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Private properties

    private lazy var settingsButton: SettingsButton = {
        let button = SettingsButton()
        settingsButton.addAction(
            UIAction { [weak self] _ in
                let items = SettingsItem.getAllItems()
                self?.show(SettingsViewController(items: items), sender: nil)
            },
            for: .touchUpInside
        )

        return button
    }()

    private let mainScreeLabel: UILabel = {
        let label = UILabel()
        label.text = "Main Screen"
        label.font = UIFont(name: "Roboto-Bold", size: 26)
        label.textColor = .white

        return label
    }()


    // MARK: - Lifcycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private methods

    private func setup() {
        view.setCustomBackground()
        view.addSubview(settingsButton)
        view.addSubview(mainScreeLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        settingsButton.layout {
            $0.bottom == view.safeAreaLayoutGuide.bottomAnchor - 40
            $0.leading == view.leadingAnchor + 70
            $0.trailing == view.trailingAnchor - 70
            $0.height == 41
        }

        mainScreeLabel.layout {
            $0.top == view.safeAreaLayoutGuide.topAnchor + 30
            $0.centerX == view.centerXAnchor
        }
    }
}
