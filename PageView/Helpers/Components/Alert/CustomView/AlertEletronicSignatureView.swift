//
//  AlertEletronicSignatureView.swift
//  Orama
//
//  Created by Eduardo Lima on 14/10/21.
//  Copyright © 2021 Órama DTVM S/A. All rights reserved.
//

import UIKit
import OramaUI

protocol AlertEletronicSignatureDelegate: AnyObject {
    func didTapContinueButton(signature: String?)
    func didTapForgotEletronicSignature()
}

class AlertEletronicSignatureView: UIView {
    // MARK: - Properties
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        view.alpha = 0.35

        let gestureBackView = UITapGestureRecognizer(
            target: self, action: #selector(
                tapGestureRecognizedBackView(sender:)
            )
        )
        view.addGestureRecognizer(gestureBackView)
        return view
    }()

    private lazy var alertView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "CloseButton"), for: .normal)
        button.addTarget(
            self,
            action: #selector(closeButtonTouched(_:)),
            for: .touchUpInside
        )

        return button
    }()

    private lazy var descriptionAlertLabel: ORLabel = {
        let label = ORLabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: .darkGraphiteGray)
        label.font = UIFont(name: .encodeSans, size: 16.0)
        label.addCustomText(
            "Para confirmar a compra, digite sua",
            weight: .regular
        ).addCustomText(
            " assinatura eletrônica.",
            weight: .medium
        ).buildCustomText()
        return label
    }()

    lazy var eletronicSignatureTextField: ORTextField = {
        let textField = ORTextField(placeholderText: "Assinatura eletrônica")
        textField.textContentType = .password
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var confirmButton: ORButton = {
        let button = ORButton(style: .primary)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Finalizar", for: .normal)
        button.addTarget(
            self,
            action: #selector(confirmButtonTouched(_:)),
            for: .touchUpInside
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var forgotEletronicSignatureLabel: ORLabel = {
        let label = ORLabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: .graphiteGray)
        label.font = UIFont(name: .encodeSans, size: 16.0, weight: .medium)
        label.text = "Esqueci minha assinatura eletrônica"
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(forgotSignatureEletronic)
        )
        label.addGestureRecognizer(tapGesture)
        return label
    }()

    weak var delegate: AlertEletronicSignatureDelegate?

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
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

        layoutViews()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupAlertCornersRadius()
    }
}

// MARK: - Actions functions
extension AlertEletronicSignatureView {
    @objc
    private func closeButtonTouched(_ sender: UIButton) {
        NotificationCenter.default.post(
            name: NSNotification.Name("dismissAlertView.com"),
            object: nil,
            userInfo: nil
        )
    }

    @objc
    private func confirmButtonTouched(_ sender: UIButton) {
        delegate?.didTapContinueButton(signature: eletronicSignatureTextField.text)
    }

    @objc
    private func forgotSignatureEletronic() {
        delegate?.didTapForgotEletronicSignature()
    }

    @objc
    private func tapGestureRecognizedBackView(sender: UITapGestureRecognizer) {
        self.endEditing(true)

        NotificationCenter.default.post(
            name: NSNotification.Name("dismissAlertView.com"),
            object: nil,
            userInfo: nil
        )
    }

    @objc
    private func dismissKeyboard() {
        self.endEditing(true)
    }

    @objc
    private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        self.frame.origin.y = 0 - keyboardSize.height
    }

    @objc
    private func keyboardWillHide(notification: NSNotification) {
        self.frame.origin.y = 0
    }
}

//MARK: - BackViewConstraints
extension AlertEletronicSignatureView {
    func layoutViews() {
        addSubview(backView)
        addSubview(alertView)

        alertView.addSubview(closeButton)
        alertView.addSubview(descriptionAlertLabel)
        alertView.addSubview(eletronicSignatureTextField)
        alertView.addSubview(confirmButton)
        alertView.addSubview(forgotEletronicSignatureLabel)

        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),

            alertView.leadingAnchor.constraint(equalTo: leadingAnchor),
            alertView.trailingAnchor.constraint(equalTo: trailingAnchor),
            alertView.bottomAnchor.constraint(equalTo: bottomAnchor),

            closeButton.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 32),
            closeButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -32),
            closeButton.widthAnchor.constraint(equalToConstant: 13.56),
            closeButton.heightAnchor.constraint(equalToConstant: 13.55),

            descriptionAlertLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 26),
            descriptionAlertLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 32),
            descriptionAlertLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -50),

            eletronicSignatureTextField.topAnchor.constraint(equalTo: descriptionAlertLabel.bottomAnchor, constant: 20),
            eletronicSignatureTextField.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 32),
            eletronicSignatureTextField.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -32),

            confirmButton.topAnchor.constraint(equalTo: eletronicSignatureTextField.bottomAnchor, constant: 26),
            confirmButton.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            confirmButton.heightAnchor.constraint(equalToConstant: 48),
            confirmButton.widthAnchor.constraint(equalToConstant: 199),

            forgotEletronicSignatureLabel.topAnchor.constraint(equalTo: confirmButton.bottomAnchor, constant: 24),
            forgotEletronicSignatureLabel.centerXAnchor.constraint(equalTo: confirmButton.centerXAnchor),
            forgotEletronicSignatureLabel.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -28)
        ])

    }

    private func setupAlertCornersRadius() {
        let path = UIBezierPath(
            roundedRect: alertView.bounds, byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 20, height: 20)
        )
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        alertView.layer.mask = mask
    }
}

