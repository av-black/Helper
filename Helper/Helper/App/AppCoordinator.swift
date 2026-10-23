//
//  AppCoordinator.swift
//  Helper
//
//  Created by Алла on 23.09.2026.
//

import UIKit

final class AppCoordinator {
    private let tabBarController: UITabBarController
    private let modulesFactory: ModulesFactory
    
    init(
        tabBarController: UITabBarController,
        modulesFactory: ModulesFactory
    ) {
        self.tabBarController = tabBarController
        self.modulesFactory = modulesFactory
    }
    
    func start() {
        let mapViewController = modulesFactory.makeMapViewController()
        let newsViewController = modulesFactory.makeNewsViewController()
        let profileViewController = modulesFactory.makeProfileViewController()
        let weatherViewController = modulesFactory.makeWeatherViewController()
        
        let mapNavigationController = UINavigationController(rootViewController: mapViewController)
        let newsNavigationController = UINavigationController(rootViewController: newsViewController)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        let weatherNavigationController = UINavigationController(rootViewController: weatherViewController)
        
        tabBarController.viewControllers = [
            mapNavigationController,
            newsNavigationController,
            profileNavigationController,
            weatherNavigationController
        ]
    }
}
