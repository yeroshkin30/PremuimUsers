//
//  SettingTableViewCell.swift
//  PremiumUser
//
//  Created by oleg on 25.06.2023.
//

import UIKit
import SnapKit

class SettingTableViewCell: UITableViewCell {
    static let identifier = "SettingCell"

    private let cellImage: UIImageView = .init()
    private let label: UILabel = .init()
    private let separatorView: UIView = .init()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        separatorInset = .zero
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        accessoryView = UIImageView(image: UIImage(named: "chevron-right"))
        contentView.addSubview(cellImage)
        contentView.addSubview(label)
        contentView.addSubview(separatorView)

        separatorView.backgroundColor = UIColor.Settings.separator

        label.font = UIFont(name: "Roboto-Medium", size: 20)
        label.textColor = .white

        setupConstraints()
    }

    private func setupConstraints() {
        cellImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.bottom.equalToSuperview().inset(10)
            $0.width.equalTo(cellImage.snp.height)
        }

        label.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.center.equalTo(self.snp.center)
        }

        separatorView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalTo(self.snp.width)
            $0.height.equalTo(1)
        }
    }

    func configure(with setting: (String, UIImage?)) {
        cellImage.image = setting.1
        label.text = setting.0
    }
}
