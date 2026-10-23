//
//  SceneDelegate.swift
//  Helper
//
//  Created by Алла on 16.09.2026.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let serviceFactory: ServiceFactoryProtocol = ServiceFactory()
        let modulesFactory = ModulesFactory(serviceFactory: serviceFactory)
        let tabBarController = UITabBarController()
        let appCoordinator = AppCoordinator(
            tabBarController: tabBarController,
            modulesFactory: modulesFactory
        )
        
        appCoordinator.start()
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        self.window = window
    }
}

