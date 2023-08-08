//
//  ListOfPlayersViewController.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 04.06.2023.
//

import UIKit

final class ListOfPlayersViewController: UIViewController, TransferPlayersDataDelegate {

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
            view.alpha = 0.2
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.backgroundView = self.backView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = .init(top: 0, left: 132, bottom: 0, right: 0)
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

        let addPlayerButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPlayer))
        navigationItem.rightBarButtonItem = addPlayerButton

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

    @objc func addPlayer() {
        let vc = AddPlayerViewController()
        vc.delegate = self
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }

    func didAdd(the player: Player) {
        PlayerManager.shared.addPlayer(player)
        tableView.reloadData()
    }
}

//MARK: - Extensions
extension ListOfPlayersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PlayerManager.shared.players.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.listOfPlayersTableViewCell, for: indexPath) as! ListOfPlayersTableViewCell
        let player = PlayerManager.shared.players[indexPath.row]
        cell.configure(with: player)
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let playerCell = cell as? ListOfPlayersTableViewCell else { return }

        let selectedPlayer = PlayerManager.shared.players[indexPath.row]

        if selectedPlayer.league == .hard {
            playerCell.leagueLabel.textColor = .systemRed
        } else {
            playerCell.leagueLabel.textColor = .systemGreen
        }
        playerCell.backgroundColor = .clear
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailProfileViewController()
        let selectedPlayers = PlayerManager.shared.players[indexPath.row]
        vc.player = selectedPlayers
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            PlayerManager.shared.players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}
