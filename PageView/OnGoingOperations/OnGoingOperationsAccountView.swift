//
//  OnGoingOperationsAccountView.swift
//  PageView
//
//  Created by Eduardo  on 20/07/21.
//

import UIKit

class OnGoingOperationsAccountView: UIView {
    
    // MARK: - Properties
    lazy var nameAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 1
        label.text = "Eduardo Lima"
        //label.textColor = UIColor(hex: "#424242")
        
        return label
    }()
    
    lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // MARK: - Initializres
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    private func setupViews() {
        self.addSubview(accountImageView)
        self.addSubview(nameAccountLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            accountImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            accountImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            accountImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7),
            accountImageView.heightAnchor.constraint(equalToConstant: 28),
            accountImageView.widthAnchor.constraint(equalToConstant: 28),
            
            nameAccountLabel.centerYAnchor.constraint(equalTo: accountImageView.centerYAnchor),
            nameAccountLabel.leadingAnchor.constraint(equalTo: accountImageView.trailingAnchor, constant: 10),
            nameAccountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

