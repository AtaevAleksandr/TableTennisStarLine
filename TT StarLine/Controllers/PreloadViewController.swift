//
//  PreloadViewController.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 02.06.2023.
//

import Foundation
import UIKit

final class PreloadViewController: UIViewController {

    private var progress: Float = 0.0
    private var timer: Timer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        loadProgress()
        addSubviews()
        setDarkMode()
        setConstraints()
    }

    //MARK: - Clousers
    private lazy var backView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var shadowProgressView: UIView = {
        let container = UIView()
        container.backgroundColor = .clear
        container.layer.cornerRadius = 10
        container.layer.shadowOffset = CGSize(width: -5, height: 5)
        container.layer.shadowRadius = 4
        container.layer.shadowOpacity = 0.6
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    private lazy var progressView: UIProgressView = {
        let view = UIProgressView(progressViewStyle: .bar)
        view.progressTintColor = .systemOrange
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "Колдуем на уменьшение \"соплей\": 0%"
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var rulesLabel: UILabel = {
        let label = UILabel()
        label.text = "Регламент"
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.sizeToFit()
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var shadowTextView: UIView = {
        let container = UIView()
        container.backgroundColor = .clear
        container.alpha = 0.8
        container.layer.cornerRadius = 10
        container.layer.shadowOffset = CGSize(width: -5, height: 5)
        container.layer.shadowRadius = 4
        container.layer.shadowOpacity = 0.6
        container.isHidden = true
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    private lazy var rulesTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .tertiarySystemBackground
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 18)
        textView.layer.cornerRadius = 10
        textView.textAlignment = .left
        textView.isHidden = true
        textView.layer.shadowOffset = CGSize(width: -5, height: 5)
        textView.layer.shadowRadius = 4
        textView.layer.shadowOpacity = 0.8
        textView.text = Rules.rules
        textView.showsVerticalScrollIndicator = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    private lazy var acceptButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.cornerStyle = .large
        button.configuration?.title = "Понял, принял!"
        button.configuration?.attributedTitle?.font = .systemFont(ofSize: 20)
        button.isHidden = true
        button.configuration?.baseBackgroundColor = .systemOrange
        button.layer.shadowOffset = CGSize(width: -5, height: 5)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.6
        button.addTarget(self, action: #selector(goToLeagueVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - Methods
    private func addSubviews() {
        [backView, rulesLabel, shadowTextView, acceptButton].forEach { view.addSubview($0) }
        shadowTextView.addSubview(rulesTextView)
        backView.addSubview(shadowProgressView)
        shadowProgressView.addSubview(progressView)
        progressView.addSubview(progressLabel)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: view.topAnchor),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 2),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            shadowProgressView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            shadowProgressView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            shadowProgressView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            shadowProgressView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            shadowProgressView.heightAnchor.constraint(equalToConstant: 25),

            progressView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            progressView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            progressView.heightAnchor.constraint(equalToConstant: 25),

            progressLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            progressLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),

            rulesLabel.bottomAnchor.constraint(equalTo: shadowTextView.topAnchor, constant: -10),
            rulesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            shadowTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            shadowTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            shadowTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            shadowTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),

            rulesTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            rulesTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            rulesTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            rulesTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),

            acceptButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            acceptButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            acceptButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func loadProgress() {
        progressView.progress = 0.0

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.progressLabel.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.timer = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
            }
        }
    }

    private func setDarkMode() {
        if traitCollection.userInterfaceStyle == .light {
            backView.image = UIImage(named: "TTView")
            shadowProgressView.layer.shadowColor = UIColor.black.cgColor
            progressView.backgroundColor = .systemGray2
            shadowTextView.layer.shadowColor = UIColor.black.cgColor
            rulesTextView.layer.shadowColor = UIColor.black.cgColor
            acceptButton.layer.shadowColor = UIColor.black.cgColor
        } else if traitCollection.userInterfaceStyle == .dark {
            backView.image = UIImage(named: "TTViewDark")
            shadowProgressView.layer.shadowColor = UIColor.white.cgColor
            progressView.backgroundColor = .systemGray3
            shadowTextView.layer.shadowColor = UIColor.white.cgColor
            rulesTextView.layer.shadowColor = UIColor.white.cgColor
            acceptButton.layer.shadowColor = UIColor.white.cgColor
        }
    }

    @objc private func updateTimer() {
        progress += 0.01
        if progress > 1.0 {
            progress = 1.0
            timer?.invalidate()
            timer = nil

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.progressView.isHidden = true
                self.rulesLabel.isHidden = false
                self.shadowTextView.isHidden = false
                self.rulesTextView.isHidden = false
                self.acceptButton.isHidden = false
            }
        }
        updateProgress(progress)
    }

    @objc private func goToLeagueVC() {
        navigationController?.pushViewController(self.createTabBarController(), animated: true)
    }

    func updateProgress(_ progress: Float) {
        progressView.progress = progress

        let percent = Int(progress * 100)
        progressLabel.text = "Колдуем на уменьшение \"соплей\": \(percent)%"
    }
}
