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
    private let goPremiumButton: GoPremiumButton = .init()
    private let stackView: UIStackView = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Handle touch events
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

        goPremiumButton.addAction(
            UIAction { _ in self.goPremiumButtonTapped() },
            for: .touchUpInside
        )

        setupStackView()
        setupConstraints()
    }

    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually

        let layer = ViewWithGradient(with: .tableGradient)
        stackView.addSubview(layer)
        layer.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        setupCellViewsForStack()
    }

    private func setupCellViewsForStack() {
        let supportCell = SettingCellView(text: "Support", image: UIImage(named: "Email"))
        supportCell.onTouchEvent = { [weak self] in
            self?.supportCellTapped()
        }

        let termsCell = SettingCellView(text: "Terms & Conditios", image: UIImage(named: "Terms"))
        termsCell.onTouchEvent = { [weak self] in
            self?.termsCellTapped()
        }

        let rateCell = SettingCellView(text: "Rate the App", image: UIImage(named: "Rate"))
        rateCell.onTouchEvent = { [weak self] in
            self?.rateCellTapped()
        }
        let shareAp = SettingCellView(text: "Share the App", image: UIImage(named: "Share"), withSeparator: false)
        shareAp.onTouchEvent = { [weak self] in
            self?.shareCellTapped()
        }

        stackView.addArrangedSubview(supportCell)
        stackView.addArrangedSubview(termsCell)
        stackView.addArrangedSubview(rateCell)
        stackView.addArrangedSubview(shareAp)
    }



    private func setupConstraints() {
        goPremiumButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalTo(view).inset(15)
            $0.height.equalTo(41)
        }

        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(185)
            $0.top.equalTo(goPremiumButton.snp.bottom).offset(50)
        }
    }
}


