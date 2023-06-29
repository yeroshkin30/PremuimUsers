//
//  SettingModel.swift
//  PremiumUser
//
//  Created by Oleg  on 28.06.2023.
//

import UIKit

struct SettingsCellModel {
    let title: String
    let image: UIImage
}

enum SettingsItem: String, CaseIterable {
    case supportCell
    case termsCell
    case rateCell
    case shareApp

    var title: String {
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

    var image: UIImage {
        switch self {
        case .supportCell:
            return UIImage(named: "Email")!
        case .termsCell:
            return UIImage(named: "Terms")!
        case .rateCell:
            return UIImage(named: "Rate")!
        case .shareApp:
            return UIImage(named: "Share")!
        }
    }

    static func getAllItems() -> [SettingsCellModel] {
        SettingsItem.allCases.compactMap { makeModel(from: $0) }
    }

    private static func makeModel(from item: SettingsItem) -> SettingsCellModel {
        .init(title: item.title, image: item.image)
    }
}
