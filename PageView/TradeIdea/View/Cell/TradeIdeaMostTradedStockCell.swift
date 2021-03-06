//
//  TradeIdeaMostTradedStockCell.swift
//  PageView
//
//  Created by Eduardo Lima on 07/02/22.
//

import UIKit
import OramaUI

final class TradeIdeaMostTradedStockCell: UICollectionViewCell {
    // MARK: - Properties
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15.0
        view.layer.shadowOpacity = 0.8
        view.layer.shadowRadius = 3.0
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var assetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "AssetSample2")
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()

    lazy var assetNameLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "PetroRio"
        label.font = UIFont(name: .encodeSans, size: 12, weight: .regular)
        label.textColor = UIColor(named: .lightGraphiteGray)
        return label
    }()

    lazy var floatingBadge: ORFloatingBadge = {
        let badge = ORFloatingBadge(
            title: "PRIO3",
            backgroundColor: UIColor(named: .lightGray)
        )
        badge.isRounded = true
        badge.translatesAutoresizingMaskIntoConstraints = false
        return badge
    }()

    lazy var pricePerAssetLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Preço por ação"
        label.font = UIFont(name: .encodeSans, size: 14, weight: .regular)
        label.textColor = UIColor(named: .graphiteGray)
        return label
    }()

    lazy var assetPriceLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = "R$ 6,10"
        label.font = UIFont(name: .encodeSans, size: 14, weight: .regular)
        label.textColor = UIColor(named: .darkGraphiteGray)
        return label
    }()

    lazy var variationOfTheDayLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Variação do dia"
        label.font = UIFont(name: .encodeSans, size: 14, weight: .regular)
        label.textColor = UIColor(named: .graphiteGray)
        return label
    }()

    lazy var valueVariationOfTheDayLabel: ORLabel = {
        let label = ORLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = "+0,45%"
        label.font = UIFont(name: .encodeSans, size: 14, weight: .regular)
        label.textColor = UIColor(named: .secondaryGreen)
        return label
    }()

    lazy var buyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "BuyButton")
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(tappBoletaButton)
        )
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        setupTopViews()
        setupMiddleViews()
    }
}

// MARK: - Custom Methods
extension TradeIdeaMostTradedStockCell {
    @objc private func tappBoletaButton() {
        NotificationCenter.default.post(
            name: NSNotification.Name("PushBoletaController"),
            object: nil
        )
    }
}

extension TradeIdeaMostTradedStockCell {
    private func setupTopViews() {
        contentView.addSubview(containerView)

        containerView.addSubview(assetImageView)
        containerView.addSubview(assetNameLabel)
        containerView.addSubview(floatingBadge)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            assetImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            assetImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            assetNameLabel.topAnchor.constraint(equalTo: assetImageView.bottomAnchor, constant: 8),
            assetNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            assetNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),

            floatingBadge.topAnchor.constraint(equalTo: assetNameLabel.bottomAnchor, constant: 12),
            floatingBadge.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            floatingBadge.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -58),
            floatingBadge.heightAnchor.constraint(equalToConstant: 30),

        ])
    }

    private func setupMiddleViews() {
        containerView.addSubview(pricePerAssetLabel)
        containerView.addSubview(assetPriceLabel)
        containerView.addSubview(variationOfTheDayLabel)
        containerView.addSubview(valueVariationOfTheDayLabel)
        containerView.addSubview(buyImageView)

        NSLayoutConstraint.activate([
            pricePerAssetLabel.topAnchor.constraint(equalTo: floatingBadge.bottomAnchor, constant: 12),
            pricePerAssetLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),

            assetPriceLabel.topAnchor.constraint(equalTo: pricePerAssetLabel.topAnchor),
            assetPriceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),

            variationOfTheDayLabel.topAnchor.constraint(equalTo: assetPriceLabel.bottomAnchor, constant: 4),
            variationOfTheDayLabel.leadingAnchor.constraint(equalTo: pricePerAssetLabel.leadingAnchor),

            valueVariationOfTheDayLabel.topAnchor.constraint(equalTo: variationOfTheDayLabel.topAnchor),
            valueVariationOfTheDayLabel.trailingAnchor.constraint(equalTo: assetPriceLabel.trailingAnchor),

            buyImageView.topAnchor.constraint(equalTo: variationOfTheDayLabel.bottomAnchor, constant: 18),
            buyImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            buyImageView.widthAnchor.constraint(equalToConstant: 188),
//            buyImageView.heightAnchor.constraint(equalToConstant: 48),

        ])
    }
}
