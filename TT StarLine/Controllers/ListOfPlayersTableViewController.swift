//
//  ListOfPlayersTableViewController.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 04.06.2023.
//

import UIKit

class ListOfPlayersTableViewController: UITableViewController {

    var players = Player.players

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: Cell.tableViewCell)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .white
        view.addSubview(backView)
        setConstraints()
        navigationController?.navigationBar.tintColor = .systemOrange
    }

    //MARK: - Clousers
    private lazy var backView: UIImageView = {
        let view = UIImageView()
        view.image = BackImage.backImage
        view.alpha = 0.3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: - Methods
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }

    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.tableViewCell, for: indexPath) as! PlayerTableViewCell


        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }


    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */


}
