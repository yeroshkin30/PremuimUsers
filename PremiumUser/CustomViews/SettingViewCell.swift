//
//  SettingViewCell.swift
//  PremiumUser
//
//  Created by Oleg  on 28.06.2023.
//

import UIKit

final class SettingsViewCell: UITableViewCell {

    // MARK: - Private properties

    private let cellImageView = UIImageView()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Medium", size: 20)
        label.textColor = .white

        return label
    }()

    private let chevronView: UIImageView = .init(image: UIImage(named: "chevron-right"))

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    func configure(with model: SettingsCellModel) {
        titleLabel.text = model.title
        cellImageView.image = model.image
    }


    private func setupView() {
        contentView.addSubview(cellImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(chevronView)
        backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: -20, left: 100, bottom: 5, right: 100)
        setupConstraints()
    }

    private func setupConstraints() {
        cellImageView.layout {
            $0.leading == leadingAnchor + 20
            $0.top == topAnchor + 10
            $0.bottom == bottomAnchor - 10
            $0.width == cellImageView.heightAnchor
        }

        titleLabel.layout {
            $0.top == topAnchor
            $0.bottom == bottomAnchor
            $0.centerX == centerXAnchor
            $0.centerY == centerYAnchor
        }

        chevronView.layout {
            $0.trailing == trailingAnchor - 15
            $0.top == topAnchor + 10
            $0.bottom == bottomAnchor - 10
        }
    }
}

