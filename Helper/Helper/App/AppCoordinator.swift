//
//  AppCoordinator.swift
//  Helper
//
//  Created by Алла on 23.09.2026.
//

import UIKit

final class AppCoordinator {
    // MARK: - Private properties
    
    private let tabBarController: UITabBarController
    private let modulesFactory: ModulesFactory
    
    // MARK: - Init
    
    init(
        tabBarController: UITabBarController,
        modulesFactory: ModulesFactory
    ) {
        self.tabBarController = tabBarController
        self.modulesFactory = modulesFactory
    }
    
    // MARK: - Public methods
    
    func start() {
        var navigationControllers = [UINavigationController]()
        
        Tabs.allCases.forEach { tab in
            let viewController: UIViewController
            let navigationController: UINavigationController
            
            switch tab {
            case .news:
                viewController = modulesFactory.makeNewsViewController()
            case .map:
                viewController = modulesFactory.makeMapViewController()
            case .weather:
                viewController = modulesFactory.makeWeatherViewController()
            case .profile:
                viewController = modulesFactory.makeProfileViewController()
            }
            
            navigationController = UINavigationController(rootViewController: viewController)
            navigationController.tabBarItem = UITabBarItem(
                title: tab.rawValue,
                image: tab.image,
                tag: tab.hashValue
            )
            navigationControllers.append(navigationController)
        }
        
        tabBarController.viewControllers = navigationControllers
        tabBarController.tabBar.tintColor = UIColor.systemCyan
        tabBarController.tabBar.unselectedItemTintColor = UIColor.secondaryLabel
    }
}
