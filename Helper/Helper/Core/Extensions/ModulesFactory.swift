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
        let viewModel = MapViewModel()
        return MapViewController(mapViewModel: viewModel)
    }
    
    func makeNewsViewController() -> UIViewController {
        let viewModel = NewsViewModel()
        return NewsViewController(newsViewModel: viewModel)
    }
    
    func makeProfileViewController() -> UIViewController {
        let viewModel = ProfileViewModel()
        return ProfileViewController(profileViewModel: viewModel)
    }
    
    func makeWeatherViewController() -> UIViewController {
        let viewModel = WeatherViewModel()
        return WeatherViewController(weatherViewModel: viewModel)
    }
}
