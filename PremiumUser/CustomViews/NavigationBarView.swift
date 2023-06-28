//
//  SettingNavBarView.swift
//  PremiumUser
//
//  Created by Oleg  on 27.06.2023.
//

import UIKit

class NavigationBarView: UIView {

    // MARK: - Private properties

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Light", size: 20)
        label.textColor = .white
        label.text = "Settings"

        return label
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addAction(
            UIAction { [weak self] _ in
                self?.onTouchEvent?(.back)
            },
            for: .touchUpInside
        )

        return button
    }()

    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "settings"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addAction(
            UIAction { [weak self] _ in
                self?.onTouchEvent?(.settings)
            },
            for: .touchUpInside
        )

        return button
    }()

    // MARK: - Public properties

    var onTouchEvent: ((TouchEvents) -> Void)?

    // MARK: - Initializers

    init() {
        super.init(frame: CGRect())
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(settingsButton)
        backgroundColor = .clear

        let gradientView = ViewWithGradient(with: .navBarGradient)
        insertSubview(gradientView, at: 0)
        gradientView.layout(in: self)

        setupConstraints()
    }

    private func setupConstraints() {
        backButton.layout {
            $0.leading == leadingAnchor + 10
            $0.centerY == centerYAnchor
            $0.height == 30
            $0.width == 30
        }

        titleLabel.layout {
            $0.top == topAnchor
            $0.bottom == bottomAnchor
            $0.centerX == centerXAnchor
            $0.centerY == centerYAnchor
        }

        settingsButton.layout {
            $0.trailing == trailingAnchor - 15
            $0.centerY == centerYAnchor
            $0.height == 30
            $0.width == 30
        }
    }

    enum TouchEvents {
        case back
        case settings
    }
}
