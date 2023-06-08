//
//  HardLeagueViewController.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 02.06.2023.
//

import UIKit

class HardLeagueViewController: UIViewController {

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
        createNavBarItems()
    }

    //MARK: - Clousers
    private lazy var backView: UIImageView = {
        let view = UIImageView()
        view.image = BackImage.backImage
        view.alpha = 0.1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var addPlayerButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .systemOrange
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(addPlayer), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var plusLabel: UILabel = {
        let label = UILabel()
        label.text = "+"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Methods
    private func createNavBarItems() {
        navigationItem.title = "Hard лига"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        appearance.titleTextAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 20, weight: .bold)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true

        let tabAppearance = UITabBarAppearance()
        tabAppearance.backgroundColor = .systemGray5
        tabBarController?.tabBar.standardAppearance = tabAppearance
        tabBarController?.tabBar.scrollEdgeAppearance = tabAppearance
    }

    private func addSubviews() {
        [backView, addPlayerButton].forEach { view.addSubview($0) }
        addPlayerButton.addSubview(plusLabel)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            backView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backView.heightAnchor.constraint(equalTo: view.widthAnchor),

            addPlayerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            addPlayerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            addPlayerButton.heightAnchor.constraint(equalToConstant: 60),
            addPlayerButton.widthAnchor.constraint(equalToConstant: 60),

            plusLabel.centerXAnchor.constraint(equalTo: addPlayerButton.centerXAnchor),
            plusLabel.centerYAnchor.constraint(equalTo: addPlayerButton.centerYAnchor, constant: -1.5),
        ])
    }

    @objc func addPlayer() {
        let vc = ListOfPlayersViewController()
        vc.navigationItem.title = "List of players Hard league"
        navigationController?.pushViewController(vc, animated: true)
    }
}

