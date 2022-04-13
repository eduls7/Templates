//
//  TradePushTableViewCell.swift
//  PageView
//
//  Created by Eduardo  on 28/09/21.
//

import UIKit

class TradePushNotificationTableViewCell: UITableViewCell {
    // MARK: - Properties
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .left
        label.text = "Estratégia solicitada disponídisponíveldisponíveldisponíveldisponíveldisponívelvel!"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        //label.textColor = UIColor(hex: "#505152")
        return label
    }()
    
    lazy var notificationBadgeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "notificationBadge")
        imageView.image = image
        return imageView
    }()
    
    private lazy var descriptionView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .left
        label.text = "Você tem uma nova opção de Renda Variável para investir."
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        //label.textColor = UIColor(hex: "#505152")
        return label
    }()
    
    private lazy var timeNotificationView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var timeNotificationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Agora"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .green
        return label
    }()
    
    private lazy var lineSeparatorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Custom Methods
extension TradePushNotificationTableViewCell {
    private func setupViews() {
        contentView.addSubview(containerView)
        
        titleView.addSubview(titleLabel)
        titleView.addSubview(notificationBadgeImage)
        stackView.addArrangedSubview(titleView)
        
        descriptionView.addSubview(descriptionLabel)
        stackView.addArrangedSubview(descriptionView)
        
        timeNotificationView.addSubview(timeNotificationLabel)
        stackView.addArrangedSubview(timeNotificationView)
        
        containerView.addSubview(stackView)
        containerView.addSubview(lineSeparatorView)
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 33),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -33),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: notificationBadgeImage.leadingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),
            
            notificationBadgeImage.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            notificationBadgeImage.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
            notificationBadgeImage.heightAnchor.constraint(equalToConstant: 12),
            notificationBadgeImage.widthAnchor.constraint(equalToConstant: 12),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor),
            
            timeNotificationLabel.leadingAnchor.constraint(equalTo: timeNotificationView.leadingAnchor),
            timeNotificationLabel.topAnchor.constraint(equalTo: timeNotificationView.topAnchor),
            timeNotificationLabel.bottomAnchor.constraint(equalTo: timeNotificationView.bottomAnchor),
            
            lineSeparatorView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
            lineSeparatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            lineSeparatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            lineSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            lineSeparatorView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
