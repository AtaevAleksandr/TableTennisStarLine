//
//  DetailProfileViewController.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 08.06.2023.
//

import UIKit

final class DetailProfileViewController: UIViewController {

    var player: Player!

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
    }

    //MARK: - Clousers
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        if player.avatar == .unknown {
            imageView.image = GenderAvatar.unknown.image
            imageView.tintColor = .lightGray
        } else {
            imageView.image = UIImage(named: player.avatar.rawValue)
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "\(player.lastName) \(player.firstName)"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Возраст: \(player.age)"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var leagueLabel: UILabel = {
        let label = UILabel()
        label.text = "Играет в лиге: \(player.league.rawValue)"
        label.font = UIFont.systemFont(ofSize: 20)
        if player.league == .hard {
            label.textColor = .systemRed
        } else {
            label.textColor = .systemGreen
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var manufactureLabel: UILabel = {
        let label = UILabel()
        label.text = "Производство: \(player.manufacture)"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var contactDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Контакт: \(player.contactData)"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Methods
    private func createNavBarItems() {
        navigationItem.title = "Информация об игроке"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .tertiarySystemBackground
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        appearance.titleTextAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 20, weight: .bold)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance

        let dismissButton = UIBarButtonItem(title: "Закрыть", style: .plain, target: self, action: #selector(dismissButtonTapped))
        navigationItem.leftBarButtonItem = dismissButton
    }

    private func addSubviews() {
        [avatarImageView, nameLabel, ageLabel, leagueLabel, manufactureLabel, contactDataLabel].forEach { view.addSubview($0) }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: view.bounds.width),

            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 8),

            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),

            leagueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            leagueLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 8),

            manufactureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            manufactureLabel.topAnchor.constraint(equalTo: leagueLabel.bottomAnchor, constant: 8),

            contactDataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contactDataLabel.topAnchor.constraint(equalTo: manufactureLabel.bottomAnchor, constant: 8)
        ])
    }

    @objc private func dismissButtonTapped() {
        dismiss(animated: true)
    }
}
