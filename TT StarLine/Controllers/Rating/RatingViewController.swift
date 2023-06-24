//
//  RatingViewController.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 08.06.2023.
//

import UIKit

class RatingViewController: UIViewController {
    
    var players = Player.players
    var sections = [LeagueType.hard, LeagueType.light]
    
    lazy var rowsToDisplay = {
        let currentLeague = sections[segmentControl.selectedSegmentIndex]
        let playersInLeague = players.filter { $0.league == currentLeague }
        let sortedPlayers = playersInLeague.sorted { $0.rating > $1.rating }
        return sortedPlayers
    }()
    
    //MARK: - View Lifecycle
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
    private lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["🏓 \(sections[0].rawValue) лига", "🏓 \(sections[1].rawValue) лига"])
        segment.selectedSegmentIndex = 0
        segment.selectedSegmentTintColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 0.8)
        segment.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
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
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.backgroundView = self.backView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorInset = .init(top: 0, left: 86, bottom: 0, right: 0)
        tableView.separatorColor = .tertiaryLabel
        tableView.register(RatingTableViewCell.self, forCellReuseIdentifier: Cell.ratingTableViewCell)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - Methods
    private func createNavBarItems() {
        navigationItem.title = "Рейтинг игроков"
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
        [tableView, segmentControl].forEach { view.addSubview($0) }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            tableView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    @objc private func handleSegmentChange() {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            let currentLeague = sections[segmentControl.selectedSegmentIndex]
            let playersInLeague = players.filter { $0.league == currentLeague }
            let sortedPlayers = playersInLeague.sorted { $0.rating > $1.rating }
            rowsToDisplay = sortedPlayers
        default:
            let currentLeague = sections[segmentControl.selectedSegmentIndex]
            let playersInLeague = players.filter { $0.league == currentLeague }
            let sortedPlayers = playersInLeague.sorted { $0.rating > $1.rating }
            rowsToDisplay = sortedPlayers
        }
        tableView.reloadData()
    }
}

extension RatingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rowsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.ratingTableViewCell, for: indexPath) as! RatingTableViewCell
        let players = rowsToDisplay[indexPath.row]
        cell.configure(with: players)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.rowsToDisplay.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
