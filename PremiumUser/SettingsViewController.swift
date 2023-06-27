//
//  SettingsViewController.swift
//  PremiumUser
//
//  Created by oleg on 25.06.2023.
//

import UIKit
import SnapKit
import SafariServices
import StoreKit

final class SettingsViewController: UIViewController {
    private let navigationBarView: NavigationBarView = .init()
    private let goPremiumButton: GoPremiumButton = .init()
    private let stackView: UIStackView = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setup()
    }

    // MARK: - Handle touch events
    func handleTapEvents(with cell: SettingCell) {
        switch cell {
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

    private func supportCellTapped() {
        let url = URL(string:"https://www.apple.com")!
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }

    private func termsCellTapped() {
        let url = URL(string:"https://www.google.com")!
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
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
        setCustomBackground()
        view.addSubview(goPremiumButton)
        view.addSubview(stackView)
        view.addSubview(navigationBarView)

        navigationBarView.onTouchEvent = { [weak self] onEvent in
            switch onEvent {
            case .back:
                self?.navigationController?.popViewController(animated: true)
            case .settings:
                print("settings tapped")
            }
        }

        goPremiumButton.addAction(
            UIAction { [weak self] _ in self?.goPremiumButtonTapped() },
            for: .touchUpInside
        )

        setupStackView()
        setupConstraints()
    }

    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill

        let gradientView = ViewWithGradient(with: .tableGradient)
        stackView.addSubview(gradientView)
        gradientView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        setupCellViewsForStack()
    }

    private func setupCellViewsForStack() {
        SettingCell.allCases.forEach { cellType in
            let cell = SettingCellView(text: cellType.text, image: cellType.image)
            cell.onTouchEvent = { [weak self] in
                self?.handleTapEvents(with: cellType)
            }
            stackView.addArrangedSubview(cell)

            if !(cellType == .shareApp) {
                stackView.addArrangedSubview(SeparatorView())
            }
        }
    }

    private func setupConstraints() {
        navigationBarView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(69)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(41)
        }

        goPremiumButton.snp.makeConstraints {
            $0.top.equalTo(navigationBarView.snp.bottom).offset(70)
            $0.leading.trailing.equalTo(view).inset(15)
            $0.height.equalTo(41)
        }

        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.top.equalTo(goPremiumButton.snp.bottom).offset(50)
        }
    }


    enum SettingCell: Int, CaseIterable {
        case supportCell
        case termsCell
        case rateCell
        case shareApp

        var text: String {
            switch self {
            case .supportCell:
                return "Support"
            case .termsCell:
                return "Terms & Conditios"
            case .rateCell:
                return "Rate the App"
            case .shareApp:
                return "Share the App"
            }
        }

        var image: UIImage? {
            switch self {
            case .supportCell:
                return UIImage(named: "Email")
            case .termsCell:
                return UIImage(named: "Terms")
            case .rateCell:
                return UIImage(named: "Rate")
            case .shareApp:
                return UIImage(named: "Share")
            }
        }
    }
}

