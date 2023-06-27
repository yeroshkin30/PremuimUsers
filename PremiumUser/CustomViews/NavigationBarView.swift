//
//  SettingNavBarView.swift
//  PremiumUser
//
//  Created by Oleg  on 27.06.2023.
//

import UIKit

class NavigationBarView: UIView {
    private let label: UILabel = .init()
    private let backButton: UIButton = .init()
    private let settingsButton: UIButton = .init()
    
    var onTouchEvent: ((TouchEvents) -> Void)?

    init() {
        super.init(frame: CGRect())
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - Touches
    func setup() {
        addSubview(backButton)
        addSubview(label)
        addSubview(settingsButton)
        backgroundColor = .clear

        let gradientView = ViewWithGradient(with: .navBarGradient)
        insertSubview(gradientView, at: 0)
        gradientView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        label.font = UIFont(name: "Roboto-Light", size: 20)
        label.textColor = .white
        label.text = "Settings"

        setupButton()
        setupConstraints()
    }

    private func setupButton() {
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addAction(
            UIAction { [weak self] _ in self?.onTouchEvent?(.back) },
            for: .touchUpInside
        )

        settingsButton.setImage(UIImage(named: "settings"), for: .normal)
        settingsButton.imageView?.contentMode = .scaleAspectFit
        settingsButton.addAction(
            UIAction { [weak self] _ in self?.onTouchEvent?(.settings)},
            for: .touchUpInside
        )
    }

    private func setupConstraints() {
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(30)
        }

        label.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.center.equalTo(self.snp.center)
        }

        settingsButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(30)
        }
    }

    enum TouchEvents {
        case back
        case settings
    }
}
