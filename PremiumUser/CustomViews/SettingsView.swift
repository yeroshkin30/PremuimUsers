//
//  SettingsView.swift
//  PremiumUser
//
//  Created by Oleg  on 28.06.2023.
//

import UIKit

final class SettingsView: UIView {

    // MARK: - Private properties

    private let goPremiumButton = GoPremiumButton()
    private let containerView = ViewWithGradient(with: .tableGradient)
    private let settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SettingsViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = .clear

        return tableView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupView() {
        addSubview(goPremiumButton)
        addSubview(containerView)

        setupEvents()
        setupConstraints()
    }

    func setupTableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        settingsTableView.dataSource = dataSource
        settingsTableView.delegate = delegate
    }

    private func setupEvents() {
        goPremiumButton.addAction(
            UIAction { [weak self] _ in
                print("faf")
            },
            for: .touchUpInside
        )
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
            $0.top == goPremiumButton.bottomAnchor + 50
            $0.height == 187
        }

        settingsTableView.layout(in: containerView)
    }
}
