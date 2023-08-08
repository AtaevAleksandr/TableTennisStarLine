//
//  AddPlayerViewController.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 02.07.2023.
//

import UIKit

final class AddPlayerViewController: UIViewController {
    
    weak var delegate: TransferPlayersDataDelegate?

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
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Имя"
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

    private lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Фамилия"
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

    private lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Возраст"
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

    private lazy var genderTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пол"
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
        textField.inputView = self.genderPickerView
        return textField
    }()

    private lazy var genderPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()

    private lazy var leagueTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Лига"
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
        textField.inputView = self.leaguePickerView
        return textField
    }()

    private lazy var leaguePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()

    private lazy var ratingTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Рейтинг"
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

    private lazy var manufactureTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Производство"
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

    private lazy var contactTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Контакт"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.keyboardType = .phonePad
        textField.textColor = .label
        textField.clearButtonMode = .whileEditing
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.label.cgColor
        textField.layer.borderWidth = 1
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
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
        navigationItem.title = "Добавить игрока"
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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [avatarImageView, firstNameTextField, lastNameTextField, ageTextField, genderTextField, leagueTextField, ratingTextField,
         manufactureTextField, contactTextField].forEach { contentView.addSubview($0) }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 100),

            avatarImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            avatarImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 160),
            avatarImageView.heightAnchor.constraint(equalToConstant: 160),

            firstNameTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            firstNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            firstNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40),

            lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 10),
            lastNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            lastNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 40),

            ageTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 10),
            ageTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            ageTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            ageTextField.heightAnchor.constraint(equalToConstant: 40),

            genderTextField.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 10),
            genderTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            genderTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            genderTextField.heightAnchor.constraint(equalToConstant: 40),

            leagueTextField.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 10),
            leagueTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            leagueTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            leagueTextField.heightAnchor.constraint(equalToConstant: 40),

            ratingTextField.topAnchor.constraint(equalTo: leagueTextField.bottomAnchor, constant: 10),
            ratingTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            ratingTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            ratingTextField.heightAnchor.constraint(equalToConstant: 40),

            manufactureTextField.topAnchor.constraint(equalTo: ratingTextField.bottomAnchor, constant: 10),
            manufactureTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            manufactureTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            manufactureTextField.heightAnchor.constraint(equalToConstant: 40),

            contactTextField.topAnchor.constraint(equalTo: manufactureTextField.bottomAnchor, constant: 10),
            contactTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            contactTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            contactTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc func textFieldDidChange() {
        updateSaveButtonState()
    }

    func updateSaveButtonState() {
        let firstNameText = firstNameTextField.text ?? ""
        let lastNameText = lastNameTextField.text ?? ""
        let ageText = ageTextField.text ?? ""
        let genderText = genderTextField.text ?? ""
        let leagueText = leagueTextField.text ?? ""
        let ratingText = ratingTextField.text ?? ""
        let manufactureText = manufactureTextField.text ?? ""
        let contactText = contactTextField.text ?? ""

        saveButton.isEnabled = ![firstNameText, lastNameText, ageText, genderText, leagueText, ratingText,
                                 manufactureText, contactText].contains { $0.isEmpty }
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
        if let avatar = GenderAvatar(rawValue: genderTextField.text ?? "Не выбран"),
           let firsName = firstNameTextField.text,
           let lastName = lastNameTextField.text,
           let age = Int(ageTextField.text ?? "0"),
           let league = LeagueType(rawValue: leagueTextField.text ?? "Не выбрана"),
           let rating = Int(ratingTextField.text ?? "0"),
           let manufacture = manufactureTextField.text,
           let contact = contactTextField.text {
            let player = Player(avatar: avatar, age: age, lastName: lastName, firstName: firsName, manufacture: manufacture, contactData: contact, league: league, rating: rating)
            delegate?.didAdd(the: player)
        }
        dismiss(animated: true)
    }

    @objc private func dismissButtonTapped() {
        dismiss(animated: true)
    }
}

//MARK: - Extensions
extension AddPlayerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case leaguePickerView:
            return LeagueType.allCases.count
        default:
            return GenderAvatar.allCases.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case leaguePickerView:
            let league = LeagueType.allCases[row]
            return league.rawValue
        default:
            let gender = GenderAvatar.allCases[row]
            return gender.rawValue
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case leaguePickerView:
            let league = LeagueType.allCases[row]
            leagueTextField.text = league.rawValue
        default:
            let gender = GenderAvatar.allCases[row]
            genderTextField.text = gender.rawValue
            if gender == GenderAvatar.unknown {
                avatarImageView.image = gender.image
            } else {
                avatarImageView.image = UIImage(named: genderTextField.text ?? "Не выбран")
            }
        }
    }
}

extension AddPlayerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

