//
//  SettingsViewController.swift
//  PremiumUser
//
//  Created by oleg on 25.06.2023.
//

import UIKit
import SnapKit
import WebKit

fileprivate let cellHeight: CGFloat = 47

final class SettingsViewController: UIViewController {
    private let goPremiumButton: GoPremiumButton = .init()
    private let tableView: UITableView = .init()
    private let webView: WKWebView = .init(frame: .zero, configuration: WKWebViewConfiguration())

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)

        tableView.backgroundView = ViewWithGradient(with: .tableGradient)
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 20
        tableView.separatorInset = .zero

        
        setup()
    }

    private func setup() {
        setCustomBackground()
        view.addSubview(goPremiumButton)
        view.addSubview(tableView)

        setupButtons()
        setupConstraints()
    }

    func setupButtons() {

    }

    func setupConstraints() {
        goPremiumButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalTo(view).inset(15)
            $0.height.equalTo(cellHeight)
        }

        tableView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view).inset(15)
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
            return ("Support", UIImage(named: "Email"))
        case .termsCell:
            return ("Terms & Conditios", UIImage(named: "Terms"))
        case .rateCell:
            return ("Rate the App", UIImage(named: "Rate"))
        case .shareAp:
            return ("Share the App", UIImage(named: "Share"))
        }
    }
}


