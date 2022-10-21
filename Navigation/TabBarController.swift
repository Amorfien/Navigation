//
//  TabBarController.swift
//  Navigation
//
//  Created by Pavel Grigorev on 20.10.2022.
//

import UIKit

class TabBarController: UITabBarController {

    var firstTabNavigationController: UINavigationController!
    var secondTabNavigationController: UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        firstTabNavigationController = UINavigationController.init(rootViewController: FeedViewController())
        secondTabNavigationController = UINavigationController.init(rootViewController: ProfileViewController())

        self.viewControllers = [firstTabNavigationController, secondTabNavigationController]
        let item1 = UITabBarItem(title: "Лента", image: UIImage(systemName: "newspaper"), tag: 0)
        let item2 = UITabBarItem(title: "Профиль", image:  UIImage(systemName: "person.circle"), tag: 1)

        firstTabNavigationController.tabBarItem = item1
        secondTabNavigationController.tabBarItem = item2

        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().backgroundColor = .white
    }
}
