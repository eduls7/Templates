//
//  VariableIncomeView.swift
//  PageView
//
//  Created by Eduardo Jr on 26/05/21.
//

import UIKit

class VariableIncomeView: UIView {
    // MARK: - Properties
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var contentScrollView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        //stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        return stackView
    }()
    
    lazy var buyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "COMPRA"
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var topRoundedView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var buyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titlelVariableIncomeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleVariableIncomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BBDC4 - Ação"
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return label
    }()
    
    lazy var bradescoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bradesco"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lineSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()
    
    lazy var containerTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ao escolher o valor ou a quantidade, eles serão arredondados pelo lote mínimo de operação (múltiplos XXXX)."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    lazy var investmentValueTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.6
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.placeholder = "  R$ 740,00"
        textField.keyboardType = .numberPad
        textField.enablesReturnKeyAutomatically = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var placeholderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var wantToInvestLabel: UILabel = {
        let label = UILabel()
        label.text = "  Quero investir  "
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var boletaRapidaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " 1 Preço por ação = R$ 74,00"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    lazy var divisionView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dotView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var amountTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.6
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.placeholder = "  R$ 10,00"
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.text = "  Quantidade  "
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var secondLineSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()
    
    lazy var toContinueLabel: UILabel = {
        let label = UILabel()
        label.text = "Para prosseguir, digite sua assinatura eletrônica"
        label.textColor = .systemGreen
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var eletronicSignatureTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.6
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.keyboardType = .numberPad
        textField.placeholder = "  Assinatura eletrônica"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var signatureDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Deve ser composta por 6 (seis) dígitos, com pelo menos um número e uma letra"
        label.textColor = .systemGray
        label.numberOfLines = 3
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var forgotSignatureLabel: UILabel = {
        let label = UILabel()
        label.text = "Esqueceu sua assinatura?"
        label.textColor = .systemGray
        label.numberOfLines = 1
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 24
        button.setTitle("Confirmar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VariableIncomeView: CodeView {
    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentScrollView)
        contentScrollView.addSubview(topStackView)
        buyView.addSubview(topRoundedView)
        buyView.addSubview(buyLabel)
        topStackView.addArrangedSubview(buyView)
        titlelVariableIncomeView.addSubview(titleVariableIncomeLabel)
        titlelVariableIncomeView.addSubview(bradescoLabel)
        topStackView.addArrangedSubview(titlelVariableIncomeView)
        contentScrollView.addSubview(containerView)
        containerView.addSubview(lineSeparatorView)
        containerView.addSubview(containerTextLabel)
//        placeholderView.addSubview(investmentValueTextField)
//        placeholderView.addSubview(wantToInvestLabel)
//        containerView.addSubview(investmentValueTextField)
        //containerView.addSubview(placeholderView)
        containerView.addSubview(investmentValueTextField)
        containerView.addSubview(wantToInvestLabel)
        containerView.addSubview(boletaRapidaLabel)
        divisionView.addSubview(dotView)
        containerView.addSubview(divisionView)
        containerView.addSubview(amountTextField)
        containerView.addSubview(amountLabel)
        containerView.addSubview(secondLineSeparatorView)
        containerView.addSubview(toContinueLabel)
        containerView.addSubview(eletronicSignatureTextField)
        containerView.addSubview(signatureDescriptionLabel)
        containerView.addSubview(forgotSignatureLabel)
        contentScrollView.addSubview(confirmButton)
    }
    
    func setupConstraints() {
        // topStackView
        NSLayoutConstraint.activate([
            scrollView.heightAnchor.constraint(equalTo: heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            //scrollView.topAnchor.constraint(equalTo: topAnchor),
            //scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentScrollView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentScrollView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            topStackView.centerXAnchor.constraint(equalTo: contentScrollView.centerXAnchor),
            topStackView.topAnchor.constraint(equalTo: contentScrollView.safeAreaLayoutGuide.topAnchor, constant: 32),
            
            //buyLabel.centerXAnchor.constraint(equalTo: buyView.centerXAnchor),
            buyLabel.topAnchor.constraint(equalTo: buyView.topAnchor),
            
            topRoundedView.heightAnchor.constraint(equalToConstant: 16),
            topRoundedView.widthAnchor.constraint(equalToConstant: 4),
            topRoundedView.trailingAnchor.constraint(equalTo: buyLabel.leadingAnchor, constant: -12),
            topRoundedView.centerYAnchor.constraint(equalTo: buyLabel.centerYAnchor),
            topRoundedView.leadingAnchor.constraint(equalTo: titleVariableIncomeLabel.leadingAnchor, constant: 12),
            
            titleVariableIncomeLabel.topAnchor.constraint(equalTo: buyLabel.bottomAnchor, constant: 16),
            titleVariableIncomeLabel.centerXAnchor.constraint(equalTo: titlelVariableIncomeView.centerXAnchor),
            
            bradescoLabel.topAnchor.constraint(equalTo: titleVariableIncomeLabel.bottomAnchor, constant: 16),
            bradescoLabel.centerXAnchor.constraint(equalTo: titlelVariableIncomeView.centerXAnchor),
            
        ])
        // containerView
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: bradescoLabel.bottomAnchor, constant: 32),
            containerView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor, constant: 32),
            containerView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor, constant: -32),
            containerView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor),
            
            lineSeparatorView.topAnchor.constraint(equalTo: containerView.topAnchor),
            lineSeparatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            lineSeparatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            lineSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            containerTextLabel.topAnchor.constraint(equalTo: lineSeparatorView.bottomAnchor, constant: 32),
            containerTextLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            containerTextLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                    
            wantToInvestLabel.topAnchor.constraint(equalTo: containerTextLabel.bottomAnchor, constant: 23),
            wantToInvestLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18),
            
            investmentValueTextField.topAnchor.constraint(equalTo: containerTextLabel.bottomAnchor, constant: 30),
            investmentValueTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            investmentValueTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            investmentValueTextField.heightAnchor.constraint(equalToConstant: 48),
            
            divisionView.heightAnchor.constraint(equalToConstant: 41),
            divisionView.widthAnchor.constraint(equalToConstant: 1),
            divisionView.topAnchor.constraint(equalTo: investmentValueTextField.bottomAnchor, constant: 8),
            divisionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            dotView.widthAnchor.constraint(equalToConstant: 5),
            dotView.heightAnchor.constraint(equalToConstant: 1),
            dotView.centerYAnchor.constraint(equalTo: divisionView.centerYAnchor),
            dotView.trailingAnchor.constraint(equalTo: divisionView.trailingAnchor),
            
            //boletaRapidaLabel.topAnchor.constraint(equalTo: investmentValueTextField.bottomAnchor, constant: 21),
            boletaRapidaLabel.trailingAnchor.constraint(equalTo: dotView.leadingAnchor, constant: -8),
            boletaRapidaLabel.centerYAnchor.constraint(equalTo: divisionView.centerYAnchor),
            
            amountLabel.topAnchor.constraint(equalTo: boletaRapidaLabel.bottomAnchor, constant: 22),
            amountLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18),
            
            amountTextField.topAnchor.constraint(equalTo: boletaRapidaLabel.bottomAnchor, constant: 28),
            amountTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            amountTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            amountTextField.heightAnchor.constraint(equalToConstant: 48),
            
            secondLineSeparatorView.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 32),
            secondLineSeparatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            secondLineSeparatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            secondLineSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            toContinueLabel.topAnchor.constraint(equalTo: secondLineSeparatorView.bottomAnchor, constant: 23),
            toContinueLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            toContinueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            eletronicSignatureTextField.topAnchor.constraint(equalTo: toContinueLabel.bottomAnchor, constant: 35),
            eletronicSignatureTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            eletronicSignatureTextField.heightAnchor.constraint(equalToConstant: 48),
            eletronicSignatureTextField.widthAnchor.constraint(equalToConstant: 263),
            
            signatureDescriptionLabel.topAnchor.constraint(equalTo: eletronicSignatureTextField.bottomAnchor, constant: 20),
            signatureDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            signatureDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            forgotSignatureLabel.topAnchor.constraint(equalTo: signatureDescriptionLabel.bottomAnchor, constant: 17),
            forgotSignatureLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            forgotSignatureLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            //forgotSignatureLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

        ])
        
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: forgotSignatureLabel.bottomAnchor, constant: 48),
            confirmButton.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor, constant: -28),
            confirmButton.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor, constant: 21),
            confirmButton.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor, constant: -21),
            confirmButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
        topStackView.backgroundColor = .black
    }
}
