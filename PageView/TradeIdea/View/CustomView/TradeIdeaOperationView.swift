//
//  TradeIdeaOperationView.swift
//  PageView
//
//  Created by Eduardo Lima on 09/02/22.
//

import UIKit
import OramaUI

final class TradeIdeaOperationView: UIView {
    // MARK: - Properties
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.backgroundColor = UIColor(named: .backgroundGray)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    private lazy var contentView: UIView = {
        let view = UIView() 
        view.backgroundColor = UIColor(named: .backgroundGray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 10.0
        view.layer.shadowOpacity = 0.8
        view.layer.shadowRadius = 3.0
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var colorLeftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "TradeIdeaRectangleBuy")
        imageView.image = image
        return imageView
    }()

    lazy var typeOrderLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "COMPRA"
        label.font = UIFont(name: .encodeSans, size: 18, weight: .semiBold)
        label.textColor = UIColor(named: .secondaryGreen)
        return label
    }()

    lazy var assetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "AssetSample")
        imageView.image = image
        return imageView
    }()

    lazy var assetNameLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Automatic Data Processing"
        label.font = UIFont(name: .encodeSans, size: 14, weight: .regular)
        label.textColor = UIColor(named: .lightGraphiteGray)
        return label
    }()

    lazy var tickerLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "ADP3"
        label.font = UIFont(name: .encodeSans, size: 18, weight: .medium)
        label.textColor = UIColor(named: .darkGraphiteGray)
        return label
    }()

    private lazy var dividerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(named: .lightGray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var descriptionFielsdLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.textAlignment = .center
        label.font = UIFont(name: .encodeSans, size: 14)
        label.textColor = UIColor(named: .darkGraphiteGray)

        label.addCustomText(
            "O valor total e a quantidade estão vinculados. ",
            weight: .medium
        ).addCustomText(
            "Preenchendo um, o outro será ajustado de acordo com o preço do ativo.",
            weight: .regular
        ).buildCustomText()

        return label
    }()

    private lazy var containerPriceView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(named: .backgroundGray)
        view.layer.cornerRadius = 10.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var pricePerAssetLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Preço por ação (ativo)"
        label.font = UIFont(name: .encodeSans, size: 14, weight: .regular)
        label.textColor = UIColor(named: .graphiteGray)
        return label
    }()

    lazy var assetPriceLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = "R$ 6,10"
        label.font = UIFont(name: .encodeSans, size: 16, weight: .medium)
        label.textColor = UIColor(named: .darkGraphiteGray)
        return label
    }()

    lazy var totalAmountTextField: ORTextField = {
        let textField = ORTextField()
        textField.placeholderAnimationDuration = 0
        textField.placeholder = "Valor total"
        textField.text = "R$ 1.000,00"
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var quantityTextField: ORTextField = {
        let textField = ORTextField()
        textField.placeholderAnimationDuration = 0
        textField.placeholder = "Quantidade"
        textField.text = "100"
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var continueButton: ORButton = {
        let button = ORButton()
        button.setTitle("Continuar", for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapContinueButton(_:)),
            for: .touchUpInside
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTopViews()
        setupMiddleViews()
        setupNotification()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Custom Methods
extension TradeIdeaOperationView {
    private func setupNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(notification:)),
            name:UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(notification:)),
            name:UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
}

// MARK: - Actions
extension TradeIdeaOperationView {
    @objc
    private func didTapContinueButton(_ sender: ORButton) {
        NotificationCenter.default.post(
            name: NSNotification.Name("tappConfirmButton"),
            object: nil
        )
    }

    @objc
    private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (
            notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        )?.cgRectValue
        else {
            return
        }
        self.frame.origin.y = 0 - keyboardSize.height
    }

    @objc
    private func keyboardWillHide(notification: NSNotification) {
        self.frame.origin.y = 0
    }

}

// MARK: - UISetup
extension TradeIdeaOperationView {
    private func setupTopViews() {
        backgroundColor = UIColor(named: .backgroundGray)
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(containerView)

        containerView.addSubview(colorLeftImageView)
        containerView.addSubview(typeOrderLabel)
        containerView.addSubview(assetImageView)
        containerView.addSubview(assetNameLabel)
        containerView.addSubview(tickerLabel)
        containerView.addSubview(dividerView)

        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -76),

            colorLeftImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
            colorLeftImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            colorLeftImageView.widthAnchor.constraint(equalToConstant: 4),

            typeOrderLabel.topAnchor.constraint(equalTo: colorLeftImageView.topAnchor),
            typeOrderLabel.leadingAnchor.constraint(equalTo: colorLeftImageView.trailingAnchor, constant: 16),

            assetImageView.topAnchor.constraint(equalTo: typeOrderLabel.bottomAnchor, constant: 14.7),
            assetImageView.leadingAnchor.constraint(equalTo: typeOrderLabel.leadingAnchor),

            assetNameLabel.topAnchor.constraint(equalTo: assetImageView.bottomAnchor, constant: 8),
            assetNameLabel.leadingAnchor.constraint(equalTo: typeOrderLabel.leadingAnchor),

            tickerLabel.topAnchor.constraint(equalTo: assetNameLabel.bottomAnchor, constant: 8),
            tickerLabel.leadingAnchor.constraint(equalTo: typeOrderLabel.leadingAnchor),

            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalTo: tickerLabel.bottomAnchor, constant: 14),
            dividerView.leadingAnchor.constraint(equalTo: colorLeftImageView.trailingAnchor, constant: 16),
            dividerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }

    private func setupMiddleViews() {
        containerView.addSubview(descriptionFielsdLabel)

        containerPriceView.addSubview(pricePerAssetLabel)
        containerPriceView.addSubview(assetPriceLabel)
        containerView.addSubview(containerPriceView)
        containerView.addSubview(totalAmountTextField)
        containerView.addSubview(quantityTextField)
        containerView.addSubview(continueButton)

        NSLayoutConstraint.activate([
            descriptionFielsdLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 32),
            descriptionFielsdLabel.leadingAnchor.constraint(equalTo: typeOrderLabel.leadingAnchor),
            descriptionFielsdLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),

            containerPriceView.leadingAnchor.constraint(equalTo: typeOrderLabel.leadingAnchor),
            containerPriceView.trailingAnchor.constraint(equalTo: dividerView.trailingAnchor),
            containerPriceView.heightAnchor.constraint(equalToConstant: 58),

            pricePerAssetLabel.centerYAnchor.constraint(equalTo: containerPriceView.centerYAnchor),
            pricePerAssetLabel.topAnchor.constraint(equalTo: descriptionFielsdLabel.bottomAnchor, constant: 50),
            pricePerAssetLabel.bottomAnchor.constraint(equalTo: containerPriceView.bottomAnchor, constant: -20),
            pricePerAssetLabel.leadingAnchor.constraint(equalTo: containerPriceView.leadingAnchor, constant: 20.33),

            assetPriceLabel.centerYAnchor.constraint(equalTo: containerPriceView.centerYAnchor),
            assetPriceLabel.trailingAnchor.constraint(equalTo: containerPriceView.trailingAnchor, constant: -20.33),

            totalAmountTextField.topAnchor.constraint(equalTo: containerPriceView.bottomAnchor, constant: 16),
            totalAmountTextField.leadingAnchor.constraint(equalTo: typeOrderLabel.leadingAnchor),
            totalAmountTextField.trailingAnchor.constraint(equalTo: dividerView.trailingAnchor),

            quantityTextField.topAnchor.constraint(equalTo: totalAmountTextField.bottomAnchor, constant: 8),
            quantityTextField.leadingAnchor.constraint(equalTo: typeOrderLabel.leadingAnchor),
            quantityTextField.trailingAnchor.constraint(equalTo: dividerView.trailingAnchor),

            continueButton.topAnchor.constraint(equalTo: quantityTextField.bottomAnchor, constant: 34),
            continueButton.leadingAnchor.constraint(equalTo: typeOrderLabel.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: dividerView.trailingAnchor),
            continueButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
            continueButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
