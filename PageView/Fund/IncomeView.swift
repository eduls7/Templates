//
//  IncomeView.swift
//  PageView
//
//  Created by Eduardo Jr on 19/05/21.
//

import UIKit

class IncomeView: UIView {
    //MARK: - Properties
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        //stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        return stackView
    }()
    
    lazy var performanceComparisonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Comparação de Rendimento"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    lazy var topViewButton: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 14
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var numberIncomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12 M"
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    lazy var fundTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Órama DI Tesouro FIRF Sim"
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    lazy var progressFundView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var percentIncomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12,03%"
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    lazy var savingsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CDI"
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    lazy var progressSavingsView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var percentSavingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "7,43%"
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
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

extension IncomeView: CodeView {
    func buildViewHierarchy() {
        //addSubview(stackView)
        addSubview(performanceComparisonLabel)
        addSubview(topViewButton)
        topViewButton.addSubview(numberIncomeLabel)
        addSubview(fundTitleLabel)
        addSubview(progressFundView)
        addSubview(percentIncomeLabel)
        addSubview(savingsTitleLabel)
        addSubview(progressSavingsView)
        addSubview(percentSavingsLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            performanceComparisonLabel.topAnchor.constraint(equalTo: self.topAnchor),
            performanceComparisonLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            topViewButton.heightAnchor.constraint(equalToConstant: 24),
            topViewButton.widthAnchor.constraint(equalToConstant: 74),
            topViewButton.topAnchor.constraint(equalTo: performanceComparisonLabel.topAnchor),
            topViewButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            topViewButton.leadingAnchor.constraint(equalTo: performanceComparisonLabel.trailingAnchor, constant: 34),
            
            numberIncomeLabel.leadingAnchor.constraint(equalTo: topViewButton.leadingAnchor, constant: 12),
            numberIncomeLabel.topAnchor.constraint(equalTo: topViewButton.topAnchor, constant: 6),
            numberIncomeLabel.bottomAnchor.constraint(equalTo: topViewButton.bottomAnchor, constant: -6),
            
            fundTitleLabel.topAnchor.constraint(equalTo: performanceComparisonLabel.bottomAnchor, constant: 29),
            fundTitleLabel.leadingAnchor.constraint(equalTo: performanceComparisonLabel.leadingAnchor),
            
            progressFundView.heightAnchor.constraint(equalToConstant: 8),
            progressFundView.widthAnchor.constraint(equalToConstant: 147),
            progressFundView.topAnchor.constraint(equalTo: fundTitleLabel.bottomAnchor, constant: 12),
            progressFundView.leadingAnchor.constraint(equalTo: performanceComparisonLabel.leadingAnchor),
            
            percentIncomeLabel.centerYAnchor.constraint(equalTo: progressFundView.centerYAnchor),
            percentIncomeLabel.trailingAnchor.constraint(equalTo: topViewButton.trailingAnchor),
            
            savingsTitleLabel.topAnchor.constraint(equalTo: progressFundView.bottomAnchor, constant: 24),
            savingsTitleLabel.leadingAnchor.constraint(equalTo: performanceComparisonLabel.leadingAnchor),
            
            progressSavingsView.heightAnchor.constraint(equalToConstant: 8),
            progressSavingsView.widthAnchor.constraint(equalToConstant: 109),
            progressSavingsView.topAnchor.constraint(equalTo: savingsTitleLabel.bottomAnchor, constant: 8),
            progressSavingsView.leadingAnchor.constraint(equalTo: performanceComparisonLabel.leadingAnchor),
            progressSavingsView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -22),
            
            percentSavingsLabel.trailingAnchor.constraint(equalTo: topViewButton.trailingAnchor),
            percentSavingsLabel.centerYAnchor.constraint(equalTo: progressSavingsView.centerYAnchor),
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
