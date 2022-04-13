//
//  TradePushEmpyRecommendations.swift
//  PageView
//
//  Created by Eduardo Lima on 17/02/22.
//

import UIKit
import OramaUI

final class TradePushEmpyRecommendations: UIView {
    // MARK: - Properties
    lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "InfoBig")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var descriptionLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: .encodeSans, size: 16, weight: .regular)
        label.textColor = UIColor(named: .darkGraphiteGray)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "No momento, não há estratégias de\ninvestimento disponíveis."
        return label
    }()

    lazy var goToHomeButton: ORButton = {
        let button = ORButton(style: .primary)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ir pra Home", for: .normal)
        return button
    }()

    lazy var backButton: ORButton = {
        let button = ORButton(style: .tertiary)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Voltar", for: .normal)
        return button
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TradePushEmpyRecommendations {

    private func setupUI() {
        self.backgroundColor = .white
        addSubview(infoImageView)
        addSubview(descriptionLabel)
        addSubview(goToHomeButton)
        addSubview(backButton)

        NSLayoutConstraint.activate([
            infoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 185.6),
            infoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),

            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            descriptionLabel.topAnchor.constraint(equalTo: infoImageView.bottomAnchor, constant: 29.67),

            goToHomeButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -24),
            goToHomeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            goToHomeButton.heightAnchor.constraint(equalToConstant: 48),
            goToHomeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 76),
            goToHomeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -76),

            backButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
        ])
    }
}
