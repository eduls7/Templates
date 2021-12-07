//
//  FundView.swift
//  PageView
//
//  Created by Eduardo Lima on 14/05/21.
//

import UIKit

class FundView: UIView {
    
    //MARK: - Properties
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        //stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        return stackView
    }()
    
    lazy var riskScaleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var fundMainStrategyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Estratégia: Renda Variável"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    lazy var stampsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var verifiedStamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var qualifiedStamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var esgSymbolStamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var fundClassLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Crédito Privado Hight Grade"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    lazy var fundTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Órama DI Tesour FIRF Simples LP"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    lazy var minimumInitialApplicationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var minimumInitialApplicationAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Aplicação mínima: R$ 1.000,00"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    lazy var percentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "6,09%"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12 meses"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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

extension FundView: CodeView {
    func buildViewHierarchy() {
        addSubview(riskScaleView)
        addSubview(stackView)
        stackView.addArrangedSubview(topView)
        topView.addSubview(fundMainStrategyLabel)
        topView.addSubview(fundClassLabel)
        stackView.addArrangedSubview(fundTitleLabel)
        stackView.addArrangedSubview(percentView)
        stackView.addArrangedSubview(minimumInitialApplicationView)
        minimumInitialApplicationView.addSubview(minimumInitialApplicationAmountLabel)
        minimumInitialApplicationView.addSubview(monthLabel)
        percentView.addSubview(percentLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            riskScaleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            riskScaleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            riskScaleView.heightAnchor.constraint(equalToConstant: 162.0),
            riskScaleView.widthAnchor.constraint(equalToConstant: 4.0),
            
            stackView.leadingAnchor.constraint(equalTo: riskScaleView.trailingAnchor, constant: 12.0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //            topView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            //            topView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            //            topView.topAnchor.constraint(equalTo: stackView.topAnchor),
            //            topView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            
            fundMainStrategyLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            fundMainStrategyLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 0),
            
            fundClassLabel.leadingAnchor.constraint(equalTo: fundMainStrategyLabel.leadingAnchor),
            fundClassLabel.topAnchor.constraint(equalTo: fundMainStrategyLabel.bottomAnchor, constant: 12),
            //fundClassLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10),
            
            fundTitleLabel.leadingAnchor.constraint(equalTo: fundMainStrategyLabel.leadingAnchor),
            fundTitleLabel.topAnchor.constraint(equalTo: fundClassLabel.bottomAnchor, constant: 24),
            //fundNameLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24),
            
            percentLabel.trailingAnchor.constraint(equalTo: percentView.trailingAnchor, constant: -17),
            percentLabel.topAnchor.constraint(equalTo: fundTitleLabel.bottomAnchor, constant: 20),
            //percentLabel.bottomAnchor.constraint(equalTo: percentView.bottomAnchor),
            
            minimumInitialApplicationAmountLabel.leadingAnchor.constraint(equalTo: minimumInitialApplicationView.leadingAnchor),
            minimumInitialApplicationAmountLabel.topAnchor.constraint(equalTo: percentLabel.bottomAnchor, constant: 8),
            minimumInitialApplicationAmountLabel.bottomAnchor.constraint(equalTo: minimumInitialApplicationView.bottomAnchor, constant: -14),
            
            monthLabel.trailingAnchor.constraint(equalTo: minimumInitialApplicationView.trailingAnchor, constant: -17),
            monthLabel.topAnchor.constraint(equalTo: minimumInitialApplicationAmountLabel.topAnchor),
            monthLabel.widthAnchor.constraint(lessThanOrEqualTo: minimumInitialApplicationAmountLabel.widthAnchor)
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
