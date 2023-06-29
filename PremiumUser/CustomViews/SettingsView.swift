//
//  SettingsView.swift
//  PremiumUser
//
//  Created by Oleg  on 28.06.2023.
//

import UIKit

final class SettingsView: UIView {

    // MARK: - Private properties

    private lazy var goPremiumButton: GoPremiumButton = {
        let button = GoPremiumButton()
        button.addAction(
            UIAction { [weak self] _ in
                self?.goPremiumButtonTapped?()
            },
            for: .touchUpInside
        )
        return button
    }()
     
    private let settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SettingsViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 20
        tableView.layer.masksToBounds = true

        return tableView
    }()

    private let containerView = ViewWithGradient(with: .tableGradient)

    // MARK: - Public properties

    var goPremiumButtonTapped: (() -> Void)?

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func setupTableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        settingsTableView.dataSource = dataSource
        settingsTableView.delegate = delegate
    }

    // MARK: - Private methods

    private func setupView() {
        setCustomBackground()
        addSubview(goPremiumButton)
        addSubview(containerView)
        containerView.addSubview(settingsTableView)

        setupConstraints()
    }

    private func setupConstraints() {
        goPremiumButton.layout {
            $0.top == safeAreaLayoutGuide.topAnchor + 130
            $0.leading == leadingAnchor + 15
            $0.trailing == trailingAnchor - 15
            $0.height == 41
        }
        containerView.layout {
            $0.leading == leadingAnchor + 15
            $0.trailing == trailingAnchor - 15
            $0.top == goPremiumButton.bottomAnchor + 50
            $0.height == 187
        }

        settingsTableView.layout(in: containerView)
    }
}
