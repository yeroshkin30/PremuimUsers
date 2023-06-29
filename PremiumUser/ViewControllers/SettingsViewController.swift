//
//  SettingsViewController.swift
//  PremiumUser
//
//  Created by oleg on 25.06.2023.
//

import UIKit
import SafariServices
import StoreKit

final class SettingsViewController: UIViewController {

    // MARK: - Private properties

    private let navigationBarView = NavigationBarView()
    private lazy var mainView = SettingsView(frame: view.bounds)
    private let modelItems: [SettingsCellModel]

    // MARK: - Initializers

    init(items: [SettingsCellModel]) {
        self.modelItems = items
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)

        setup()
    }

    // MARK: - Handle touch events

    private func supportCellTapped() {
        let url = URL(string:"https://www.apple.com")!
        showSafariVC(with: url)
    }

    private func termsCellTapped() {
        let url = URL(string:"https://www.google.com")!
        showSafariVC(with: url)
    }

    private func rateCellTapped() {
        guard let scene = view.window?.windowScene else { return }
        SKStoreReviewController.requestReview(in: scene)
    }

    private func shareCellTapped() {
        let activityController = UIActivityViewController(
            activityItems: ["https://www.google.com"],
            applicationActivities: nil
        )
        present(activityController, animated: true, completion: nil)
    }

    private func showSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    private func goPremiumButtonTapped() {
        let alertController = UIAlertController(
            title: "Congratulations!",
            message: "You bought a subscription.",
            preferredStyle: .alert
        )

        let cancelAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }


    // MARK: - Setup

    private func setup() {
        view = mainView
        mainView.setupTableView(dataSource: self, delegate: self)
        view.addSubview(navigationBarView)

        setupNavigationEvents()
        setupConstraints()
    }

    private func setupNavigationEvents() {
        navigationBarView.onTouchEvent = { [weak self] onEvent in
            switch onEvent {
            case .back:
                self?.navigationController?.popViewController(animated: true)
            case .settings:
                print("settings tapped")
            }
        }
    }

    private func setupConstraints() {
        navigationBarView.layout {
            $0.top == view.safeAreaLayoutGuide.topAnchor + 10
            $0.leading == view.leadingAnchor + 15
            $0.trailing == view.trailingAnchor - 15
            $0.height == 41
        }
    }
}

// MARK: - Table DataSource

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SettingsViewCell

        let model = modelItems[indexPath.row]
        cell.configure(with: model)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        47
    }
}

// MARK: - Table Delegate

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        switch SettingsItem.allCases[indexPath.row] {
        case .supportCell:
            supportCellTapped()
        case .termsCell:
            termsCellTapped()
        case .rateCell:
            rateCellTapped()
        case .shareApp:
            shareCellTapped()
        }
    }
}
