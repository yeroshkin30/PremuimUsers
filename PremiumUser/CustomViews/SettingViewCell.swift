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
    private let chevronView = UIImageView(image: UIImage(named: "chevron-right"))

    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.separatorColor()!

        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Medium", size: 20)
        label.textColor = .white

        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func configure(with model: SettingsCellModel) {
        titleLabel.text = model.title
        cellImageView.image = model.image
    }

    func hideSeparatorView() {
        separatorView.isHidden = true
    }

    // MARK: - Private methods

    private func setupView() {
        [cellImageView, titleLabel, chevronView, separatorView].forEach {
            contentView.addSubview($0)
        }
        backgroundColor = .clear
       
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

        separatorView.layout {
            $0.height == 1
            $0.bottom == bottomAnchor
            $0.width == widthAnchor
        }
    }
}

