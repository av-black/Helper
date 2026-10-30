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
        let mapViewController = modulesFactory.makeMapViewController()
        let newsViewController = modulesFactory.makeNewsViewController()
        let profileViewController = modulesFactory.makeProfileViewController()
        let weatherViewController = modulesFactory.makeWeatherViewController()
        
        let mapNavigationController = UINavigationController(rootViewController: mapViewController)
        let newsNavigationController = UINavigationController(rootViewController: newsViewController)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        let weatherNavigationController = UINavigationController(rootViewController: weatherViewController)
        
        configureTabBarItems(
            news: newsNavigationController,
            map: mapNavigationController,
            weather: weatherNavigationController,
            profile: profileNavigationController
        )
        
        tabBarController.viewControllers = [
            newsNavigationController,
            mapNavigationController,
            weatherNavigationController,
            profileNavigationController
        ]
    }
    
    // MARK: - Private methods
    
    private func configureTabBarItems(
        news: UINavigationController,
        map: UINavigationController,
        weather: UINavigationController,
        profile: UINavigationController
    ) {
        news.tabBarItem = UITabBarItem(
            title: "Новости",
            image: TabBarIcon.news,
            tag: 0
        )
        
        map.tabBarItem = UITabBarItem(
            title: "Карта",
            image: TabBarIcon.map,
            tag: 1
        )
        
        weather.tabBarItem = UITabBarItem(
            title: "Погода",
            image: TabBarIcon.weather,
            tag: 2
        )
        
        profile.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: TabBarIcon.profile,
            tag: 3
        )
        
        tabBarController.tabBar.tintColor = UIColor.systemCyan
        tabBarController.tabBar.unselectedItemTintColor = UIColor.secondaryLabel
    }
}
