//
//  TradeIdeaHeaderView.swift
//  PageView
//
//  Created by Eduardo Lima on 03/02/22.
//

import UIKit
import OramaUI

final class TradeIdeaHeaderView: UICollectionReusableView {
    lazy var containerview: UIView = {
        let view = UIView()
//        view.backgroundColor = UIColor(named: .defaultBlue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var titleLabel: ORLabel = {
        let label = ORLabel()
        label.text = "Estratégia do Analista"
        label.textAlignment = .left
        label.font = UIFont(name: .encodeSans, size: 20, weight: .medium)
        label.textColor = UIColor(named: .darkGraphiteGray)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        self.addSubview(titleLabel)
//        containerview.addSubview(titleLabel)

        NSLayoutConstraint.activate([
//            containerview.topAnchor.constraint(equalTo: self.topAnchor),
//            containerview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            containerview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            containerview.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])
    }
}
