//
//  TradePushEmpyNotificationTableViewCell.swift
//  PageView
//
//  Created by Eduardo Lima on 19/10/21.
//

import UIKit

class TradePushEmpyNotificationTableViewCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Não há nenhuma notificação no momento"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TradePushEmpyNotificationTableViewCell {
    private func setupView() {
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        contentView.backgroundColor = .white

        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                        
            titleLabel.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor
            ),
            
            titleLabel.centerXAnchor.constraint(
                equalTo: containerView.centerXAnchor
            ),
        ])
    }
}
