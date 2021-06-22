//
//  SceneDelegate.swift
//  FP
//
//  Created by Дмитрий Константинов on 03.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let rootView = Builder.createMainView()
        let navBar = UINavigationController(rootViewController: rootView)
        navBar.navigationBar.prefersLargeTitles = true
        navBar.navigationBar.topItem?.title = "Randime"
        let tabBar = UITabBarController()
        tabBar.viewControllers = [navBar]
        window.rootViewController = tabBar
        self.window = window
        window.makeKeyAndVisible()
    }
}

