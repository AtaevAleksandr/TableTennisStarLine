//
//  ListOfPlayersViewController.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 04.06.2023.
//

import UIKit

class ListOfPlayersViewController: UIViewController {

    var players = Player.players
    lazy var sortedPlayers = players.sorted { $0.league.rawValue < $1.league.rawValue }

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        addSubviews()
        setConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createNavBarItems()
        tableView.reloadData()
    }

    //MARK: - Clousers
    private lazy var backView: UIImageView = {
        let view = UIImageView()
        view.image = BackImage.backImage
        view.contentMode = .scaleAspectFit
        if traitCollection.userInterfaceStyle == .light {
            view.alpha = 0.1
        } else if traitCollection.userInterfaceStyle == .dark {
            view.alpha = 0.3
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.backgroundView = self.backView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = .init(top: 0, left: 156, bottom: 0, right: 0)
        tableView.separatorColor = .tertiaryLabel
        tableView.register(ListOfPlayersTableViewCell.self, forCellReuseIdentifier: Cell.listOfPlayersTableViewCell)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    //MARK: - Methods
    private func createNavBarItems() {
        navigationItem.title = "Список игроков"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .tertiarySystemBackground
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        appearance.titleTextAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 20, weight: .bold)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true

        let tabAppearance = UITabBarAppearance()
        tabAppearance.backgroundColor = .tertiarySystemBackground
        tabBarController?.tabBar.standardAppearance = tabAppearance
        tabBarController?.tabBar.scrollEdgeAppearance = tabAppearance
    }

    private func addSubviews() {
        view.addSubview(tableView)
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.listOfPlayersTableViewCell, for: indexPath) as! ListOfPlayersTableViewCell
        cell.configure(with: sortedPlayers[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let playerCell = cell as? ListOfPlayersTableViewCell else { return }

        let selectedPlayers = sortedPlayers[indexPath.row]

        if selectedPlayers.league == .hard {
            playerCell.leagueLabel.textColor = .systemRed
        } else {
            playerCell.leagueLabel.textColor = .systemGreen
        }
        playerCell.backgroundColor = .clear
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailProfileViewController()
        let selectedPlayers = sortedPlayers[indexPath.row]
        vc.player = selectedPlayers
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
