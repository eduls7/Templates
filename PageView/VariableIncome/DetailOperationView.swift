//
//  DetailOperationView.swift
//  PageView
//
//  Created by Eduardo Lima on 17/11/21.
//

import UIKit

class DetailOperationView: UIView {
    
    lazy var operationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Operação"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var operationValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BBDC4"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var priceOfTheDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Preço do dia"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var priceOfTheDayValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 74,00"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Quantidade"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var amountValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "800"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var askedByLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Solicitado por"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var requesterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Matheus Silva Penharanda"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    lazy var cpfLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CPF: 071.758.745-29"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    lazy var requestedInLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Solicitado em"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var requestDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "23/03/2020 às 16:29:52"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
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

extension DetailOperationView {
    private func setupView() {
        
        addSubview(operationLabel)
        addSubview(operationValueLabel)
        addSubview(priceOfTheDayLabel)
        addSubview(amountLabel)
        addSubview(priceOfTheDayValueLabel)
        addSubview(amountValueLabel)
        addSubview(askedByLabel)
        addSubview(requesterLabel)
        addSubview(cpfLabel)
        addSubview(requestedInLabel)
        addSubview(requestDateLabel)
        
        NSLayoutConstraint.activate([
            operationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            operationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            operationValueLabel.topAnchor.constraint(equalTo: operationLabel.bottomAnchor, constant: 12),
            operationValueLabel.leadingAnchor.constraint(equalTo: operationLabel.leadingAnchor),
            
            priceOfTheDayLabel.topAnchor.constraint(equalTo: operationValueLabel.bottomAnchor, constant: 22),
            priceOfTheDayLabel.leadingAnchor.constraint(equalTo: operationLabel.leadingAnchor),
            
            amountLabel.topAnchor.constraint(equalTo: priceOfTheDayLabel.topAnchor),
            amountLabel.leadingAnchor.constraint(equalTo: priceOfTheDayLabel.trailingAnchor, constant: 40),
            
            priceOfTheDayValueLabel.topAnchor.constraint(equalTo: priceOfTheDayLabel.bottomAnchor, constant: 12),
            priceOfTheDayValueLabel.leadingAnchor.constraint(equalTo: operationLabel.leadingAnchor),
            
            amountValueLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 12),
            amountValueLabel.leadingAnchor.constraint(equalTo: amountLabel.leadingAnchor),
            
            askedByLabel.topAnchor.constraint(equalTo: priceOfTheDayValueLabel.bottomAnchor, constant: 26),
            askedByLabel.leadingAnchor.constraint(equalTo: operationLabel.leadingAnchor),
            
            requesterLabel.topAnchor.constraint(equalTo: askedByLabel.bottomAnchor, constant: 12),
            requesterLabel.leadingAnchor.constraint(equalTo: operationLabel.leadingAnchor),
            
            cpfLabel.topAnchor.constraint(equalTo: requesterLabel.bottomAnchor, constant: 12),
            cpfLabel.leadingAnchor.constraint(equalTo: operationLabel.leadingAnchor),
            
            requestedInLabel.topAnchor.constraint(equalTo: cpfLabel.bottomAnchor, constant: 24),
            requestedInLabel.leadingAnchor.constraint(equalTo: operationLabel.leadingAnchor),
            
            requestDateLabel.topAnchor.constraint(equalTo: requestedInLabel.bottomAnchor, constant: 12),
            requestDateLabel.leadingAnchor.constraint(equalTo: operationLabel.leadingAnchor),
            requestDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
        ])
    }
}
