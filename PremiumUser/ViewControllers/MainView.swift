//
//  MainView.swift
//  PremiumUser
//
//  Created by Oleg  on 29.06.2023.
//

import UIKit

final class MainView: UIView {

    // MARK: - Private properties

    private lazy var settingsButton: SettingsButton = {
        let button = SettingsButton()
        button.addAction(
            UIAction { [weak self] _ in
                self?.onSettingsEvent?()
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

    // MARK: - Events

    var onSettingsEvent: (() -> Void)?

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - SetupView
    
    private func setupView() {
        setCustomBackground()
        addSubview(settingsButton)
        addSubview(mainScreeLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        settingsButton.layout {
            $0.bottom == safeAreaLayoutGuide.bottomAnchor - 40
            $0.leading == leadingAnchor + 70
            $0.trailing == trailingAnchor - 70
            $0.height == 41
        }

        mainScreeLabel.layout {
            $0.top == safeAreaLayoutGuide.topAnchor + 30
            $0.centerX == centerXAnchor
        }
    }
}
