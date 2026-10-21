//
//  ModulesFactory.swift
//  Helper
//
//  Created by Alla Mozharova on 21.10.2026.
//

import UIKit

final class ModulesFactory {
    let serviceFactory: ServiceFactoryProtocol
    
    init(serviceFactory: ServiceFactoryProtocol) {
        self.serviceFactory = serviceFactory
    }
    
    func makeMapViewController() -> UIViewController {
        return MapViewController()
    }
    
    func makeNewsViewController() -> UIViewController {
        return NewsViewController()
    }
    
    func makeProfileViewController() -> UIViewController {
        return ProfileViewController()
    }
    
    func makeWeatherViewController() -> UIViewController {
        return WeatherViewController()
    }
}
