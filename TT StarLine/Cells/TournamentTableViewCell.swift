//
//  TournamentTableViewCell.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 10.07.2023.
//

import UIKit

class TournamentTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        accessoryType = .disclosureIndicator
        addSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Clousers
    private lazy var nameOfTournamentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .label
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var countOfPlayersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Methods
    private func addSubviews() {
        [nameOfTournamentLabel, countOfPlayersLabel].forEach { contentView.addSubview($0) }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameOfTournamentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameOfTournamentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),

            countOfPlayersLabel.leadingAnchor.constraint(equalTo: nameOfTournamentLabel.leadingAnchor),
            countOfPlayersLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    func configure(with tournament: Tournament) {
        nameOfTournamentLabel.text = "Название: \(tournament.name)"
        countOfPlayersLabel.text = "Количество игроков: \(tournament.countOfPlayers)"
    }
}
