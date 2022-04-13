//
//  TradeIdeaSuccessView.swift
//  PageView
//
//  Created by Eduardo Lima on 08/02/22.
//

import UIKit
import OramaUI

protocol TradeIdeaSuccessDelegate: AnyObject {
    func popRootViewController()
}

final class TradeIdeaSuccessView: UIView {
    // MARK: - Properties
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var closeButtonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "CloseButtonGreen")
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapCloseButton)
        )
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var unionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Union")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 2
        label.text = "A Sua operação foi  realizada com sucesso!"
        label.font = UIFont(name: .encodeSans, size: 32, weight: .light)
        label.textColor = UIColor(named: .darkGraphiteGray)
        return label
    }()

    lazy var dateLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "27 de Outubro de 2021 - 15:45:04"
        label.font = UIFont(name: .encodeSans, size: 18, weight: .semiBold)
        label.textColor = UIColor(named: .lightGraphiteGray)
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()

    private lazy var tickerLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Papel"
        label.font = UIFont(name: .encodeSans, size: 14, weight: .regular)
        label.textColor = UIColor(named: .graphiteGray)
        return label
    }()

    lazy var tickerNameLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "ADP3"
        label.font = UIFont(name: .encodeSans, size: 18, weight: .medium)
        label.textColor = UIColor(named: .darkGraphiteGray)
        return label
    }()

    private lazy var typeOperationLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Tipo da operação"
        label.font = UIFont(name: .encodeSans, size: 14, weight: .regular)
        label.textColor = UIColor(named: .graphiteGray)
        return label
    }()

    lazy var typeOperationValueLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Compra"
        label.font = UIFont(name: .encodeSans, size: 18, weight: .medium)
        label.textColor = UIColor(named: .darkGraphiteGray)
        return label
    }()

    private lazy var limitPriceLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Preço limite para compra"
        label.font = UIFont(name: .encodeSans, size: 14, weight: .regular)
        label.textColor = UIColor(named: .graphiteGray)
        return label
    }()

    lazy var limitPriceValueLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "R 6,40"
        label.font = UIFont(name: .encodeSans, size: 18, weight: .medium)
        label.textColor = UIColor(named: .darkGraphiteGray)
        return label
    }()

    private lazy var quantityLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Quantidade"
        label.font = UIFont(name: .encodeSans, size: 14, weight: .regular)
        label.textColor = UIColor(named: .graphiteGray)
        return label
    }()

    lazy var quantityValueLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "163"
        label.font = UIFont(name: .encodeSans, size: 18, weight: .medium)
        label.textColor = UIColor(named: .darkGraphiteGray)
        return label
    }()

    private lazy var amountLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Valor total"
        label.font = UIFont(name: .encodeSans, size: 14, weight: .regular)
        label.textColor = UIColor(named: .graphiteGray)
        return label
    }()

    lazy var amountValueLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "R$ 994,30"
        label.font = UIFont(name: .encodeSans, size: 18, weight: .medium)
        label.textColor = UIColor(named: .darkGraphiteGray)
        return label
    }()

    private lazy var requesterLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Solicatado por"
        label.font = UIFont(name: .encodeSans, size: 14, weight: .regular)
        label.textColor = UIColor(named: .graphiteGray)
        return label
    }()

    private lazy var requesterView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var requesterValueLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "CBLC 009239"
//        label.backgroundColor = .blue
        label.font = UIFont(name: .encodeSans, size: 18, weight: .medium)
        label.textColor = UIColor(named: .darkGraphiteGray)
        return label
    }()

    private lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Info")
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(infoImageTouched(_:))
        )
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var dateRequesteLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Solicitado em"
        label.font = UIFont(name: .encodeSans, size: 14, weight: .regular)
        label.textColor = UIColor(named: .graphiteGray)
        return label
    }()

    lazy var dateRequesteValueLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "27/10/2021 às 11:00:52"
        label.font = UIFont(name: .encodeSans, size: 18, weight: .medium)
        label.textColor = UIColor(named: .darkGraphiteGray)
        return label
    }()

    private lazy var statusView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: .backgroundGray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var descriptionStatusLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font = UIFont(name: .encodeSans, size: 14)
        label.addCustomText(
            "Para consultar o status dela, acesse \n",
            color: UIColor(named: .darkGraphiteGray),
            weight: .regular)
            .addCustomText(
                "Seus Investimentos > Operações em Andamento.",
                color: UIColor(named: .primaryColor),
                weight: .semiBold)
            .buildCustomText()
        return label
    }()

    private lazy var descriptionOngoingOperationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: .backgroundGray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var ongoingOperationsLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont(name: .encodeSans, size: 14)
        label.textColor = UIColor(named: .darkGraphiteGray)
        label.addCustomText(
            "As ",
            weight: .regular)
            .addCustomText(
                "operações em andamento ",
                weight: .semiBold
            ).addCustomText(
                "ficam destacadas com este ícone:",
                weight: .regular
            ).buildCustomText()
        return label
    }()

    private lazy var newOperationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "NewOperation")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var backCurrentSelectionButton: ORButton = {
        let button = ORButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Voltar para seleção atual", for: .normal)
        button.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        return button
    }()

    private lazy var ongoingOperationsButton: ORButton = {
        let button = ORButton(style: .secondary)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ir para operações em andamento", for: .normal)
        return button
    }()

    weak var delegate: TradeIdeaSuccessDelegate?

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTopView()
        setupMiddleView()
        setupBottomView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Action Methods
extension TradeIdeaSuccessView {
    @objc private func infoImageTouched(_ sender: UIButton) {
        NotificationCenter.default.post(
            name: NSNotification.Name("tappedInfo"),
            object: nil,
            userInfo: nil
        )
    }

    @objc private func didTapCloseButton() {
        delegate?.popRootViewController()
    }
}

// MARK: - UI Methods
extension TradeIdeaSuccessView {
    private func setupTopView() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(closeButtonImageView)
        contentView.addSubview(unionImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            closeButtonImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 44),
            closeButtonImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -38),

            unionImageView.topAnchor.constraint(equalTo: closeButtonImageView.bottomAnchor, constant: 55.1),
            unionImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            unionImageView.heightAnchor.constraint(equalToConstant: 78.1),
            unionImageView.widthAnchor.constraint(equalToConstant: 72.4),

            titleLabel.topAnchor.constraint(equalTo: unionImageView.bottomAnchor, constant: 30.7),
            titleLabel.leadingAnchor.constraint(equalTo: unionImageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),

            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            dateLabel.leadingAnchor.constraint(equalTo: unionImageView.leadingAnchor)
        ])
    }

    private func setupMiddleView() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(tickerLabel)
        stackView.addArrangedSubview(tickerNameLabel)
        stackView.addArrangedSubview(typeOperationLabel)
        stackView.addArrangedSubview(typeOperationValueLabel)
        stackView.addArrangedSubview(limitPriceLabel)
        stackView.addArrangedSubview(limitPriceValueLabel)
        stackView.addArrangedSubview(quantityLabel)
        stackView.addArrangedSubview(quantityValueLabel)
        stackView.addArrangedSubview(amountLabel)
        stackView.addArrangedSubview(amountValueLabel)
        stackView.addArrangedSubview(requesterLabel)
        stackView.addArrangedSubview(requesterView)
        requesterView.addSubview(requesterValueLabel)
        requesterView.addSubview(infoImageView)

        stackView.addArrangedSubview(dateRequesteLabel)
        stackView.addArrangedSubview(dateRequesteValueLabel)

        stackView.setCustomSpacing(16, after: tickerNameLabel)
        stackView.setCustomSpacing(16, after: typeOperationValueLabel)
        stackView.setCustomSpacing(16, after: limitPriceValueLabel)
        stackView.setCustomSpacing(16, after: quantityValueLabel)
        stackView.setCustomSpacing(16, after: amountValueLabel)
        stackView.setCustomSpacing(16, after: requesterView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: unionImageView.leadingAnchor),
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),

            requesterValueLabel.topAnchor.constraint(equalTo: requesterView.topAnchor),
            requesterValueLabel.leadingAnchor.constraint(equalTo: requesterView.leadingAnchor),
            requesterValueLabel.bottomAnchor.constraint(equalTo: requesterView.bottomAnchor),

            infoImageView.centerYAnchor.constraint(equalTo: requesterValueLabel.centerYAnchor),
            infoImageView.leadingAnchor.constraint(equalTo: requesterValueLabel.trailingAnchor, constant: 7),
            infoImageView.heightAnchor.constraint(equalToConstant: 20),
            infoImageView.widthAnchor.constraint(equalToConstant: 20)
        ])
    }

    private func setupBottomView() {
        contentView.addSubview(statusView)
        statusView.addSubview(descriptionStatusLabel)
        statusView.addSubview(ongoingOperationsLabel)
        contentView.addSubview(backCurrentSelectionButton)
        contentView.addSubview(ongoingOperationsButton)

        descriptionOngoingOperationView.addSubview(ongoingOperationsLabel)
        descriptionOngoingOperationView.addSubview(newOperationImageView)

        statusView.addSubview(descriptionOngoingOperationView)

        NSLayoutConstraint.activate([
            statusView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24),
            statusView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            statusView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            descriptionStatusLabel.topAnchor.constraint(equalTo: statusView.topAnchor, constant: 32),
            descriptionStatusLabel.leadingAnchor.constraint(equalTo: statusView.leadingAnchor, constant: 32),
            descriptionStatusLabel.trailingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: -107),

            descriptionOngoingOperationView.topAnchor.constraint(equalTo: descriptionStatusLabel.bottomAnchor, constant: 17),
            descriptionOngoingOperationView.leadingAnchor.constraint(equalTo: descriptionStatusLabel.leadingAnchor),
            descriptionOngoingOperationView.trailingAnchor.constraint(equalTo: descriptionStatusLabel.trailingAnchor),
            descriptionOngoingOperationView.bottomAnchor.constraint(equalTo: statusView.bottomAnchor, constant: -32),


            ongoingOperationsLabel.topAnchor.constraint(equalTo: descriptionOngoingOperationView.topAnchor),
            ongoingOperationsLabel.leadingAnchor.constraint(equalTo: descriptionOngoingOperationView.leadingAnchor),
            ongoingOperationsLabel.trailingAnchor.constraint(equalTo: descriptionOngoingOperationView.trailingAnchor),
            ongoingOperationsLabel.bottomAnchor.constraint(equalTo: descriptionOngoingOperationView.bottomAnchor),

            newOperationImageView.leadingAnchor.constraint(equalTo: descriptionOngoingOperationView.leadingAnchor, constant: 235),
            newOperationImageView.bottomAnchor.constraint(equalTo: ongoingOperationsLabel.bottomAnchor, constant: -2),

            backCurrentSelectionButton.topAnchor.constraint(equalTo: statusView.bottomAnchor, constant: 24),
            backCurrentSelectionButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            backCurrentSelectionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            backCurrentSelectionButton.heightAnchor.constraint(equalToConstant: 48),

            ongoingOperationsButton.topAnchor.constraint(equalTo: backCurrentSelectionButton.bottomAnchor, constant: 16),
            ongoingOperationsButton.leadingAnchor.constraint(equalTo: backCurrentSelectionButton.leadingAnchor),
            ongoingOperationsButton.trailingAnchor.constraint(equalTo: backCurrentSelectionButton.trailingAnchor),
            ongoingOperationsButton.heightAnchor.constraint(equalToConstant: 48),
            ongoingOperationsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),

        ])
    }
}
