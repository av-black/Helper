//
//  Tabs.swift
//  Helper
//
//  Created by Alla Mozharova on 15.10.2026.
//

import UIKit

enum Tabs: String, CaseIterable {
    case news = "Новости"
    case map = "Карта"
    case weather = "Погода"
    case profile = "Профиль"
    
    var image: UIImage? {
        switch self {
        case .news:
            return UIImage(systemName: "newspaper")
        case .map:
            return UIImage(systemName: "map")
        case .weather:
            return UIImage(systemName: "cloud.sun.rain")
        case .profile:
            return UIImage(systemName: "person.crop.circle")
        }
    }
}
