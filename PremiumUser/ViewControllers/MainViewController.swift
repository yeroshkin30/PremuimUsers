//
//  MainScreen.swift
//  PremiumUser
//
//  Created by oleg on 25.06.2023.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Private properties

    private lazy var mainView = MainView(frame: view.bounds)

    // MARK: - Lifcycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setup()
    }

    // MARK: - Private methods

    private func setup() {
        view = mainView
        mainView.onSettingsEvent = { [weak self] in
            let items = SettingsItem.getAllItems()
            self?.show(SettingsViewController(items: items), sender: nil)
        }
    }
}
