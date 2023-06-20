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
        let navigationController = UINavigationController(rootViewController: ListOfPlayersViewController())
        navigationController.tabBarItem = UITabBarItem(title: "Игроки", image: UIImage(systemName: "person.3.fill"), tag: 0)
        return navigationController
    }

    private func createSecondController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: RatingViewController())
        navigationController.tabBarItem = UITabBarItem(title: "Рейтинг", image: UIImage(systemName: "chart.line.uptrend.xyaxis"), tag: 1)
        return navigationController
    }

    private func createThirdController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: TournamentsViewController())
        navigationController.tabBarItem = UITabBarItem(title: "Турниры", image: UIImage(systemName: "figure.table.tennis"), tag: 2)
        return navigationController
    }

    func createTabBarController() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [createFirstController(), createSecondController(), createThirdController()]
        tabBar.tabBar.tintColor = .systemOrange
        tabBar.navigationItem.hidesBackButton = true
        return tabBar
    }
}
