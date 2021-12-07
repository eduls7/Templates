//
//  VariableIncomeQuickTicketConfirmView.swift
//  Orama
//
//  Created by Eduardo  on 21/06/21.
//  Copyright © 2021 Órama DTVM S/A. All rights reserved.
//

import UIKit

class VariableIncomeQuickTicketConfirmView: UIView {
    
    // MARK: - Properties
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        //scroll.backgroundColor = .white
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        //view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var confirmImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "Check-circle")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var confirmLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Matheus, a sua operação foi realizada com sucesso! "
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var operationDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dados da operação"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let statckView = UIStackView()
        statckView.axis = .vertical
        statckView.spacing = 15
        statckView.translatesAutoresizingMaskIntoConstraints = false
        return statckView
    }()
    
    lazy var contentOperationDetailsView: DetailOperationView = {
        let view = DetailOperationView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var contentOperationDetailsView2: DetailOperationView = {
        let view = DetailOperationView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Voltar à Renda Variável", for: .normal)
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

// MARK: - Custom Methods
extension VariableIncomeQuickTicketConfirmView: CodeView {
    func buildViewHierarchy() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(confirmImageView)
        contentView.addSubview(confirmLabel)
        contentView.addSubview(operationDataLabel)
        
        stackView.addArrangedSubview(contentOperationDetailsView)
        stackView.addArrangedSubview(contentOperationDetailsView2)
        
        contentView.addSubview(stackView)


//        contentView.addSubview(contentOperationDetailsView)
        contentView.addSubview(backButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            //scrollView.heightAnchor.constraint(equalTo: heightAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            
            confirmImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 71.0),
            confirmImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            confirmImageView.widthAnchor.constraint(equalToConstant: 71),
            confirmImageView.heightAnchor.constraint(equalToConstant: 71),
            
            confirmLabel.topAnchor.constraint(equalTo: confirmImageView.bottomAnchor, constant: 29.1),
            confirmLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 57),
            confirmLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -57),
            confirmLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            operationDataLabel.topAnchor.constraint(equalTo: confirmLabel.bottomAnchor, constant: 40),
            operationDataLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            
            stackView.topAnchor.constraint(equalTo: operationDataLabel.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
//            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),

            
            backButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            backButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            backButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),

        ])
    }
    
    func setupAdditionalConfiguration() {
    }
}
