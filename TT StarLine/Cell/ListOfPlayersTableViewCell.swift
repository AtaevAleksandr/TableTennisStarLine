//
//  ListOfPlayersTableViewCell.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 04.06.2023.
//

import UIKit

class ListOfPlayersTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Clousers
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 70
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .systemOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var leagueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var manufactureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var contactDataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Methods
    private func addSubviews() {
        [avatarImageView, nameLabel, ageLabel, leagueLabel, manufactureLabel, contactDataLabel].forEach { contentView.addSubview($0) }
    }

    private func setConstraints() {
        let margin: CGFloat = 8

        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 140),
            avatarImageView.heightAnchor.constraint(equalToConstant: 140),

            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: margin),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),

            ageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),

            leagueLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            leagueLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 4),

            manufactureLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            manufactureLabel.topAnchor.constraint(equalTo: leagueLabel.bottomAnchor, constant: 4),
            manufactureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),

            contactDataLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            contactDataLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin)
        ])
    }

    func configure(with player: Player) {
        avatarImageView.image = UIImage(named: player.avatar.rawValue)
        nameLabel.text = "\(player.firstName) \(player.lastName)"
        ageLabel.text = "Возраст: \(player.age)"
        leagueLabel.text = "Играет в лиге: \(player.league.rawValue)"
        manufactureLabel.text = "Производство: \(player.manufacture)"
        contactDataLabel.text = "Контакт: \(player.contactData)"
    }
}
