//
//  TradeIdeaTermView.swift
//  PageView
//
//  Created by Eduardo Lima on 10/03/22.
//

import UIKit
import OramaUI

class TradeIdeaTermView: UIView {
    // MARK: - Properties
    private lazy var squareView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10.0
        view.backgroundColor = UIColor(named: .backgroundGray)
        return view
    }()

    private lazy var descriptionTermLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: .encodeSans, size: 14)
        label.textColor = UIColor(named: .darkGraphiteGray)
        label.addCustomText(
            "Desenquadramento em Renda Variável\n\nEste investimento ",
            weight: .light
        ).addCustomText(
            "não está adequado ao seu perfil ",
            weight: .bold
        ).addCustomText(
            "de investidor. ",
            weight: .light
        ).addCustomText(
            "Para continuar com a aplicação",
            weight: .bold
        ).addCustomText(
            ", de acordo e ciente do que os riscos inerentes não condizem com as suas características de investimentos, ",
            weight: .light
        ).addCustomText(
            "marque o campo abaixo.",
            weight: .bold
        ).buildCustomText()
        return label
    }()

    lazy var checkBox: ORCheckBox = {
        let checkBox = ORCheckBox()
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        return checkBox
    }()

    private lazy var checkBoxDescriptionLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: .encodeSans, size: 14)
        label.textColor = UIColor(named: .darkGraphiteGray)
        label.addCustomText(
            "Estou de acordo com o termo de desenquadramento dessa operação",
            weight: .light
        ).buildCustomText()
        return label
    }()

    private lazy var continueButton: ORButton = {
        let buttom = ORButton()
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.setTitle("Continuar", for: .normal)
        return buttom
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TradeIdeaTermView {
    private func setupUI() {
        self.backgroundColor = .white
        self.addSubview(squareView)
        squareView.addSubview(descriptionTermLabel)
        squareView.addSubview(checkBox)
        squareView.addSubview(checkBoxDescriptionLabel)
        self.addSubview(continueButton)

        NSLayoutConstraint.activate([
            squareView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            squareView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            squareView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),

            descriptionTermLabel.topAnchor.constraint(equalTo: squareView.topAnchor, constant: 20),
            descriptionTermLabel.leadingAnchor.constraint(equalTo: squareView.leadingAnchor, constant: 16),
            descriptionTermLabel.trailingAnchor.constraint(equalTo: squareView.trailingAnchor, constant: -16),
//            descriptionTermLabel.bottomAnchor.constraint(equalTo: squareView.bottomAnchor, constant: -84),

            checkBox.centerYAnchor.constraint(equalTo: checkBoxDescriptionLabel.centerYAnchor),
            checkBox.leadingAnchor.constraint(equalTo: descriptionTermLabel.leadingAnchor),
//            checkBox.topAnchor.constraint(equalTo: descriptionTermLabel.bottomAnchor, constant: 24),
            checkBox.widthAnchor.constraint(equalToConstant: 24),
            checkBox.heightAnchor.constraint(equalToConstant: 24),

            checkBoxDescriptionLabel.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 14),
            checkBoxDescriptionLabel.topAnchor.constraint(equalTo: descriptionTermLabel.bottomAnchor, constant: 34),
            checkBoxDescriptionLabel.trailingAnchor.constraint(equalTo: squareView.trailingAnchor, constant: -16),
            checkBoxDescriptionLabel.bottomAnchor.constraint(equalTo: squareView.bottomAnchor, constant: -20),

            continueButton.heightAnchor.constraint(equalToConstant: 48),
            continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            continueButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -28)
        ])
    }
}
