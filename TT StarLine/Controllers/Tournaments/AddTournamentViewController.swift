//
//  AddTournamentViewController.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 14.07.2023.
//

import UIKit

class AddTournamentViewController: UIViewController {

    weak var delegate: TransferTournamentsDataDelegate?

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
    }

    //MARK: - Clousers
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var nameOfTournament: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Название турнира"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = .label
        textField.clearButtonMode = .whileEditing
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.label.cgColor
        textField.layer.borderWidth = 1
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        setKeyboardSettings(forUITextField: textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var countOfPlayers: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Количество игроков"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.keyboardType = .numberPad
        textField.textColor = .label
        textField.clearButtonMode = .whileEditing
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.label.cgColor
        textField.layer.borderWidth = 1
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        setKeyboardSettings(forUITextField: textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var saveButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveButtonTapped))
        button.isEnabled = false
        return button
    }()

    //MARK: - Methods
    private func createNavBarItems() {
        navigationItem.title = "Создать турнир"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .tertiarySystemBackground
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        appearance.titleTextAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 20, weight: .bold)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance

        let dismissButton = UIBarButtonItem(title: "Закрыть", style: .plain, target: self, action: #selector(dismissButtonTapped))
        navigationItem.leftBarButtonItem = dismissButton
        navigationItem.rightBarButtonItem = saveButton
    }

    private func addSubviews() {
        [logoImageView, nameOfTournament, countOfPlayers].forEach { view.addSubview($0) }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 300),
            logoImageView.heightAnchor.constraint(equalToConstant: 300),

            nameOfTournament.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            nameOfTournament.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            nameOfTournament.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            nameOfTournament.heightAnchor.constraint(equalToConstant: 40),

            countOfPlayers.topAnchor.constraint(equalTo: nameOfTournament.bottomAnchor, constant: 10),
            countOfPlayers.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            countOfPlayers.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            countOfPlayers.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc func textFieldDidChange() {
        let nameText = nameOfTournament.text ?? ""
        let countText = countOfPlayers.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty && !countText.isEmpty
    }

    private func setKeyboardSettings(forUITextField textField: UITextField) {
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapOnView)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc func saveButtonTapped() {
        if let nameTournament = nameOfTournament.text,
           let countPlayers = Int(countOfPlayers.text ?? "0") {
            let tournament = Tournament(name: nameTournament, countOfPlayers: countPlayers)
            delegate?.didAdd(the: tournament)
        }
        dismiss(animated: true)
    }

    @objc private func dismissButtonTapped() {
        dismiss(animated: true)
    }
}

//MARK: - Extension
extension AddTournamentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
