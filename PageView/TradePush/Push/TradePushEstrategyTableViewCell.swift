//
//  TradePushTableViewCell.swift
//  PageView
//
//  Created by Eduardo  on 28/09/21.
//

import UIKit
import OramaUI

enum EstrategyType: String {
    case buy = "COMPRA"
    case sell = "VENDA"
}

//protocol TradePushEstrategyTableViewCellDelegate: AnyObject {
//    func updateContinueButton(_ sender: ORCheckBox)
//}


class TradePushEstrategyTableViewCell: UITableViewCell {
    // MARK: - Properties
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
        
    lazy var colorLeftView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //let image = UIImage(named: "TradePushRectangleBuy")
        //imageView.image = image
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var strategyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Estratégia 1"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        //label.textColor = UIColor(hex: "#505152")
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Solicitada em 05/05/2021 às 18h"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        //label.textColor = UIColor(hex: "#505152")
        return label
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
//        label.text = "COMPRA"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
//        label.textColor = UIColor.systemGreen
        return label
    }()
    
    lazy var assetNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "BBDC4"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        //label.textColor = UIColor(hex: "#505152")
        return label
    }()
    
    lazy var limitPricePurchaseTextField: ORTextField = {
        let textField = ORTextField(placeholderText: "Preço limite para compra")
//        textField.text = "R$ 1.000,00"
        textField.keyboardType = .numberPad
        textField.placeholderAnimationDuration = 0.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var quantityTextField: ORTextField = {
        let textField = ORTextField(placeholderText: "Quantidade")
//        textField.text = "100"
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var investmentValueTextField: ORTextField = {
        let textField = ORTextField(placeholderText: "Valor do investimento")
//        textField.text = "R$ 2.000,00"
        textField.keyboardType = .numberPad
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var trashImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "Trash")
        imageView.image = image
        return imageView
    }()
    
    lazy var deleteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Excluir"
        label.isUserInteractionEnabled = true
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        let gestureRecognizer = UITapGestureRecognizer()
        gestureRecognizer.addTarget(self, action: #selector(didTapDeleteLabel))
        label.addGestureRecognizer(gestureRecognizer)
        return label
    }()
    
    lazy var checkBox: ORCheckBox = {
        let checkBox = ORCheckBox()
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.delegate = self
//        let gesture = UITapGestureRecognizer(
//            target: self,
//            action: #selector(didTapCheckBox(sender:))
//        )
//        checkBox.addGestureRecognizer(gesture)
        return checkBox
    }()
    
    lazy var selectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Selecionar"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        //label.textColor = UIColor(hex: "#505152")
        return label
    }()
    
//    weak var delegate: TradePushEstrategyTableViewCellDelegate?
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Custom Methods
extension TradePushEstrategyTableViewCell {
    func setupCell(viewType: EstrategyType) {
        let compra = "COMPRA"
        let venda = "VENDA"
        limitPricePurchaseTextField.text = "R$ 1.000,00"
        quantityTextField.text = "100"
        investmentValueTextField.text = "R$ 10.000,00"
        if viewType.rawValue == compra {
            let image = UIImage(named: "TradePushRectangleBuy")
            colorLeftView.image = image
            
            typeLabel.text = "COMPRA"
            typeLabel.textColor = .systemGreen
            return
        }
        
        let image = UIImage(named: "TradePushRectangleSale")
        colorLeftView.image = image
        typeLabel.text = "VENDA"
        typeLabel.textColor = .systemOrange
    }
}

// MARK: - Actions
extension TradePushEstrategyTableViewCell: ORCheckBoxDelegate {
    
    func checkbox(_ checkbox: ORCheckBox, state: ORCheckBox.CheckBoxState) {
        let checkBoxState = ["operationCheckBoxState": checkbox]
        
        NotificationCenter.default.post(
            name: NSNotification.Name("ContinueButton.com"),
            object: nil,
            userInfo: checkBoxState
        )
    }
    
    @objc
    private func didTapDeleteLabel() {
        let alertInfo = ["alertType": AlertType.exclusion]
        
        NotificationCenter.default.post(
            name: NSNotification.Name("alertView.com"),
            object: nil,
            userInfo: alertInfo
        )
    }
}
// MARK: - UISetup
extension TradePushEstrategyTableViewCell {
    private func setupViews() {
//        contentView.backgroundColor = .lightGray
        contentView.addSubview(containerView)
        
        containerView.addSubview(colorLeftView)
        
        stackView.addArrangedSubview(strategyLabel)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(typeLabel)
        stackView.addArrangedSubview(assetNameLabel)
        stackView.addArrangedSubview(limitPricePurchaseTextField)
        stackView.addArrangedSubview(quantityTextField)
        stackView.addArrangedSubview(investmentValueTextField)
        stackView.addArrangedSubview(bottomView)
        
        bottomView.addSubview(trashImageView)
        bottomView.addSubview(deleteLabel)
        bottomView.addSubview(checkBox)
        bottomView.addSubview(selectLabel)
        
        containerView.addSubview(stackView)
        
        stackView.setCustomSpacing(13, after: self.typeLabel)
        stackView.setCustomSpacing(26, after: self.assetNameLabel)
        stackView.setCustomSpacing(26, after: self.limitPricePurchaseTextField)
        stackView.setCustomSpacing(26, after: self.quantityTextField)
        stackView.setCustomSpacing(41, after: self.investmentValueTextField)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            colorLeftView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            colorLeftView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            colorLeftView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -69),
//            colorLeftView.heightAnchor.constraint(equalToConstant: 364),
            colorLeftView.widthAnchor.constraint(equalToConstant: 4),
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: colorLeftView.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            //trashImageView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            trashImageView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            trashImageView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            trashImageView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -20),
            trashImageView.heightAnchor.constraint(equalToConstant: 28),
            trashImageView.widthAnchor.constraint(equalToConstant: 28),
            
            deleteLabel.leadingAnchor.constraint(equalTo: trashImageView.trailingAnchor, constant: 8),
            deleteLabel.centerYAnchor.constraint(equalTo: trashImageView.centerYAnchor),
            
            selectLabel.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 8),
            selectLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            selectLabel.centerYAnchor.constraint(equalTo: trashImageView.centerYAnchor),
            
            /// OBS: height and width constranits causing ambiguous contraints
//            checkBox.heightAnchor.constraint(equalToConstant: 24),
//            checkBox.widthAnchor.constraint(equalToConstant: 24),
            checkBox.centerYAnchor.constraint(equalTo: trashImageView.centerYAnchor)
        ])
    }
}
