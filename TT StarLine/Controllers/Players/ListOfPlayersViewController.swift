//
//  ListOfPlayersViewController.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 04.06.2023.
//

import UIKit

class ListOfPlayersViewController: UIViewController {

    var players = Player.players

    //MARK: - View lifecycle
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
        view.alpha = 0.3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: Cell.tableViewCell)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    //MARK: - Methods
    private func createNavBarItems() {
        navigationItem.title = "Список игроков"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        appearance.titleTextAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 20, weight: .bold)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance

        let tabAppearance = UITabBarAppearance()
        tabAppearance.backgroundColor = .systemGray5
        tabBarController?.tabBar.standardAppearance = tabAppearance
        tabBarController?.tabBar.scrollEdgeAppearance = tabAppearance
    }

    private func addSubviews() {
        [tableView, backView].forEach { view.addSubview($0) }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            backView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
}

extension ListOfPlayersViewController: UITableViewDelegate, UITableViewDataSource {
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        return 0
    //    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.tableViewCell, for: indexPath) as! PlayerTableViewCell


        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }

    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}