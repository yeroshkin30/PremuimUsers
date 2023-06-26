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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell() {
        contentView.addSubview(cellImage)
        contentView.addSubview(label)

        label.font = UIFont(name: "Roboto-Medium", size: 20)
        
        cellImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(cellImage.snp.height)
        }

        label.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.center.equalToSuperview()
        }
    }

    func configure(with setting: (String, UIImage?)) {
        cellImage.image = setting.1
        label.text = setting.0
    }
}
