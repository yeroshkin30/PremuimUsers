//
//  MainScreen.swift
//  PremiumUser
//
//  Created by oleg on 25.06.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private let settingsButton: SettingsButton = .init()
    private let mainScreeLabel: UILabel = .init()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        setCustomBackground()
        view.addSubview(settingsButton)
        view.addSubview(mainScreeLabel)

        mainScreeLabel.text = "Main Screen"
        mainScreeLabel.font = UIFont(name: "Roboto-Bold", size: 26)
        mainScreeLabel.textColor = .white

        settingsButton.addAction(
            UIAction { [weak self] _ in self?.show(SettingsViewController(), sender: nil) },
            for: .touchUpInside
        )

        setupConstraints()
    }

    private func setupConstraints() {
        settingsButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
            $0.leading.trailing.equalToSuperview().inset(70)
            $0.height.equalTo(40)
        }

        mainScreeLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.centerX.equalToSuperview()
        }
    }
}
