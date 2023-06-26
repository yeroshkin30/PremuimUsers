//
//  SettingsViewController.swift
//  PremiumUser
//
//  Created by oleg on 25.06.2023.
//

import UIKit
import SnapKit
import WebKit

fileprivate let cellHeight: CGFloat = 55

final class SettingsViewController: UIViewController {
    private let goPremiumButton: UIButton = .init()
    private let tableView: UITableView = .init()
    private let webView: WKWebView = .init(frame: .zero, configuration: WKWebViewConfiguration())

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 30
        tableView.separatorInset = .zero
        setup()
    }

    private func setup() {
        view.backgroundColor = .black
        view.addSubview(goPremiumButton)
        view.addSubview(tableView)

        setupButtons()
        setupConstraints()
    }

    func setupButtons() {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "heart")
        config.imagePlacement = .leading
        config.imagePadding = 60
        config.title = "Go Premium"

        config.attributedTitle = AttributedString(
            "Go Premium",
            attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: "Roboto Medium", size: 25)!])
        )
        config.titleAlignment = .center
        config.baseForegroundColor = .white
        config.preferredSymbolConfigurationForImage = .init(pointSize: 25)
        config.background.backgroundColor = .purple.withAlphaComponent(0.5)
        config.contentInsets =  NSDirectionalEdgeInsets(top: 0, leading: -config.imagePadding, bottom: 0, trailing: config.imagePadding)
        config.cornerStyle = .capsule

        goPremiumButton.configuration = config
    }

    func setupConstraints() {
        goPremiumButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalTo(view).inset(10)
            $0.height.equalTo(cellHeight)
        }

        tableView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view).inset(10)
            $0.top.equalTo(goPremiumButton.snp.bottom).offset(50)
            $0.height.equalTo(cellHeight * 4)
        }
    }
}


//MARK: - DataSource
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier) as! SettingTableViewCell

        let setting = SettingCell(rawValue: indexPath.row)!
        cell.configure(with: setting.values)

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}


//MARK: - Delegete
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case SettingCell.supportCell.rawValue:
            let supportVC = WebViewController(urlForWebView: URL(string:"https://www.apple.com")!)
            present(supportVC, animated: true)
        case SettingCell.termsCell.rawValue:
            print("Test")
        case SettingCell.rateCell.rawValue:
            print("Test")
        case SettingCell.shareAp.rawValue:
            print("Test")
        default:
            return
        }

    }
}


//MARK: - SettingConfiguration
enum SettingCell: Int {
case supportCell
case termsCell
case rateCell
case shareAp

    var values: (String, UIImage?) {
        switch self {
        case .supportCell:
            return ("Support", UIImage(systemName: "envelope"))
        case .termsCell:
            return ("Terms & Conditios", UIImage(systemName: "backward"))
        case .rateCell:
            return ("Rate the App", UIImage(systemName: "star.fill"))
        case .shareAp:
            return ("Share the App", UIImage(systemName: "arrowshape.turn.up.left.fill"))
        }
    }
}
