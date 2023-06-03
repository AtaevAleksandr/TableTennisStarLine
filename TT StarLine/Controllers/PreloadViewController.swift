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
        addSubviews()
        setConstraints()

        progressView.progress = 0.0

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        }
    }

    private lazy var backView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "TTView")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var progressView: UIProgressView = {
        let view = UIProgressView(progressViewStyle: .bar)
        view.backgroundColor = .gray
        view.progressTintColor = .systemOrange
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: -8, height: 8)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "Идёт загрузка хорошего настроения: 0%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func setConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: view.topAnchor),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 2),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            progressView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            progressView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            progressView.heightAnchor.constraint(equalToConstant: 25),

            progressLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            progressLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),

        ])
    }

    private func addSubviews() {
        view.addSubview(backView)
        backView.addSubview(progressView)
        progressView.addSubview(progressLabel)
    }

    @objc private func updateTimer() {
        progress += 0.01
        if progress > 1.0 {
            progress = 1.0
            timer?.invalidate()
            timer = nil

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.navigationController?.pushViewController(self.createTabBarController(), animated: true)
            }
        }
        updateProgress(progress)
    }

    func updateProgress(_ progress: Float) {
        progressView.progress = progress

        let percent = Int(progress * 100)
        progressLabel.text = "Идёт загрузка хорошего настроения: \(percent)%"
    }
}
