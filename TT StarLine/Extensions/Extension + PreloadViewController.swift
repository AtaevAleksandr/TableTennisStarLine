//
//  Extension + PreloadViewController.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 02.06.2023.
//

import Foundation
import UIKit

extension PreloadViewController {

    private func createFirstController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: HardViewController())
        navigationController.tabBarItem = UITabBarItem(title: "Hard", image: UIImage(systemName: "figure.table.tennis"), tag: 0)
        return navigationController
    }

    private func createSecondController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: LiteViewController())
        navigationController.tabBarItem = UITabBarItem(title: "Lite", image: UIImage(systemName: "figure.tennis"), tag: 1)
        return navigationController
    }

    func createTabBarController() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [createFirstController(), createSecondController()]
        tabBar.tabBar.backgroundColor = .systemGray5
        tabBar.tabBar.tintColor = .systemOrange
        tabBar.navigationItem.hidesBackButton = true
        return tabBar
    }
}
