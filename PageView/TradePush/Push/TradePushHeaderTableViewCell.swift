//
//  TradePushHeaderTableViewCell.swift
//  PageView
//
//  Created by Eduardo  on 29/09/21.
//

import UIKit

class TradePushHeaderTableViewCell: UITableViewCell {
    // MARK: - Properties
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 10.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Selecione abaixo as opções de ordens\nsolicitadas e finalize as operações."
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        //label.textColor = UIColor(hex: "#505152")
        return label
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

extension TradePushHeaderTableViewCell {
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            headerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            headerLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
}
