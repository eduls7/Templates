//
//  AlertTermView.swift
//  Orama
//
//  Created by Eduardo Lima on 14/10/21.
//  Copyright © 2021 Órama DTVM S/A. All rights reserved.
//

import UIKit
import OramaUI

protocol AlertTermViewDelegate: AnyObject {
    func dismissAlert()
}

final class AlertTermView: UIView {
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        view.alpha = 0.35

        let gestureBackView = UITapGestureRecognizer(
            target: self, action: #selector(
                closeButtonTouched
            )
        )
        view.addGestureRecognizer(gestureBackView)
        return view
    }()

    private lazy var alertView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
//        view.layer.cornerRadius = 20
        let path = UIBezierPath(
            roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 3, height: 3)
        )
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
        return view
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(
            UIImage(
                named: "CloseButton"
            ),
            for: .normal
        )
        button.addTarget(
            self,
            action: #selector(closeButtonTouched),
            for: .touchUpInside
        )

        return button
    }()

    lazy var titleLabel: ORLabel = {
        let label = ORLabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Desenquadramento em Renda Variável"
        label.font = UIFont(name: .encodeSans, size: 16, weight: .semiBold)
        label.textColor = UIColor(named: .darkGraphiteGray)
        return label
    }()

    lazy var investorProfileLabel: ORLabel = {
        let label = ORLabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Este investimento não está adequado ao\nseu perfil de investidor.\nPara continuar com a aplicação, é preciso\nestar de acordo com o termo de\ndesenquadramento. "
        label.font = UIFont(name: .encodeSans, size: 16, weight: .regular)
        label.textColor = UIColor(named: .darkGraphiteGray)
        return label
    }()

    private lazy var termLabel: ORLabel = {
        let label = ORLabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Para continuar com a aplicação, é preciso estar de acordo com o termo de desenquadramento."
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()

    weak var delegate: AlertTermViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
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

extension AlertTermView {

    @objc
    private func closeButtonTouched() {
        NotificationCenter.default.post(
            name: NSNotification.Name("dismissAlertView.com"),
            object: nil,
            userInfo: nil
        )
    }
}

//MARK: - BackViewContraints
extension AlertTermView {
    private func layoutViews() {
        addSubview(backView)
        addSubview(alertView)

        alertView.addSubview(closeButton)
        alertView.addSubview(titleLabel)
        alertView.addSubview(investorProfileLabel)

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

            titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 26),
            titleLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -32),

            investorProfileLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            investorProfileLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            investorProfileLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            investorProfileLabel.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -28)
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
