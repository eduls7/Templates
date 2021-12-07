//
//  TradePushTermTableViewCell.swift
//  PageView
//
//  Created by Eduardo  on 29/09/21.
//

import UIKit
import OramaUI

class TradePushTermTableViewCell: UITableViewCell {
    // MARK: - Properties
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    lazy var checkBox: ORCheckBox = {
        let checkBox = ORCheckBox()
        checkBox.delegate = self
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        return checkBox
    }()
    
    lazy var descriptionTermLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Estou de acordo com o termo de desenquadramento dessa operação"
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        //label.textColor = UIColor(hex: "#505152")
        return label
    }()
    
    lazy var understandButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entenda", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.addTarget(self, action: #selector(didTapUnderstanButton), for: .touchUpInside)
        return button
    }()
    
    lazy var confirmButton: ORButton = {
        let button = ORButton(style: .primary)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Confirmar", for: .normal)
        button.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
//        button.isEnabled = false
        return button
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TradePushTermTableViewCell: ORCheckBoxDelegate {
    
    func checkbox(_ checkbox: ORCheckBox, state: ORCheckBox.CheckBoxState) {
        let checkBoxState = ["termCheckBoxState": state]
        
        NotificationCenter.default.post(
            name: NSNotification.Name("ContinueButton.com"),
            object: nil,
            userInfo: checkBoxState
        )
    }
    
    @objc
    private func didTapUnderstanButton() {
        let alertInfo = ["alertType": AlertType.term]
        NotificationCenter.default.post(name: NSNotification.Name("alertView.com"), object: nil, userInfo: alertInfo)
    }
    
    @objc
    private func didTapConfirmButton() {
        let alertInfo = ["alertType": AlertType.eletronicSignature]
        NotificationCenter.default.post(name: NSNotification.Name("alertView.com"), object: nil, userInfo: alertInfo)
    }
}

extension TradePushTermTableViewCell {
    private func setupViews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(containerView)
        containerView.addSubview(checkBox)
        containerView.addSubview(descriptionTermLabel)
        containerView.addSubview(understandButton)
                
        stackView.addArrangedSubview(confirmButton)
        
        containerView.isHidden = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -42),

//            containerView.topAnchor.constraint(equalTo: stackView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            checkBox.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 26),
            checkBox.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            descriptionTermLabel.topAnchor.constraint(equalTo: checkBox.topAnchor),
            descriptionTermLabel.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 12),
            descriptionTermLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -38),
            
            understandButton.topAnchor.constraint(equalTo: descriptionTermLabel.bottomAnchor, constant: 16),
            understandButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -36),
            understandButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
            
//            confirmButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 24),
//            confirmButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//            confirmButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            confirmButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 71),
            confirmButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -71),
            confirmButton.heightAnchor.constraint(equalToConstant: 48),
//            confirmButton.widthAnchor.constraint(equalToConstant: 90),

        ])
    }
}
