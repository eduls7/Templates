//
//  TradeIdeaViewController.swift
//  PageView
//
//  Created by Eduardo Lima on 03/02/22.
//

import UIKit
import OramaUI

final class TradeIdeaViewController: UIViewController, UICollectionViewDelegate {
    // MARK: - Properties
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = UIColor(named: .backgroundGray)
        collectionView.register(
            TradeIdeaAnalystStrategyCell.self,
            forCellWithReuseIdentifier: TradeIdeaAnalystStrategyCell.identifier
        )
        collectionView.register(
            TradeIdeaMostTradedStockCell.self,
            forCellWithReuseIdentifier: TradeIdeaMostTradedStockCell.identifier
        )
        collectionView.register(
            TradeIdeaHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "\(TradeIdeaHeaderView.self)"
        )
        return collectionView
    }()

    //MARK: - LifeCycle View
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNotificationCenter()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.title = "Meus investimentos"
    }
}

// MARK: - UICollectionViewDataSource
extension TradeIdeaViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 10
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TradeIdeaAnalystStrategyCell.identifier,
                for: indexPath
            ) as! TradeIdeaAnalystStrategyCell

            return cell
        default:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TradeIdeaMostTradedStockCell.identifier,
                for: indexPath
            ) as! TradeIdeaMostTradedStockCell

            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath
    ) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "\(TradeIdeaHeaderView.self)",
                for: indexPath
            )

            guard let headerView = headerView as? TradeIdeaHeaderView else { return UICollectionReusableView() }

            switch indexPath.section { ///TODO Move to a Presenter
            case 0:
                headerView.titleLabel.text = "Estratégia do Analista"
            case 1:
                headerView.titleLabel.text = "Maiores altas do dia da Bolsa"
            default:
                headerView.titleLabel.text = "Mais negociadas do dia na Bolsa"
            }
            return headerView
        default:
            print("error")
        }
        return TradeIdeaHeaderView()
    }

}

// MARK: - Ui Setup
extension TradeIdeaViewController {
    private func setupUI() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            switch sectionIndex {
            case 0:
                let group = self.createGroup(sectionIndex)
                let section = self.configSection(with: group)
                return section
            case 1:
                let group = self.createGroup(sectionIndex)
                let section = self.configSection(with: group)
                return section
            default:
                let group = self.createGroup(sectionIndex)
                let section = self.configSection(with: group)
                return section
            }
        }
        return layout
    }

    private func configSection(with group: NSCollectionLayoutGroup) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging

        let sectionHeader = self.createHeader()
        section.boundarySupplementaryItems = [sectionHeader]

        return section
    }

    private func createGroup(_ sectionIndex: Int) ->  NSCollectionLayoutGroup {
        switch sectionIndex {
        case 0:
            return getBankerCardGroup()
        case 1:
            return getTrendStockCardGroup()
        default:
            return getTrendStockCardGroup()
        }
    }

    private func getBankerCardGroup() -> NSCollectionLayoutGroup {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(244),
                heightDimension: .absolute(393)
            )
        )

        item.contentInsets = NSDirectionalEdgeInsets(
            top: 16.0,
            leading: 19.0,
            bottom: 32,
            trailing: 5.0
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(244),
                heightDimension: .absolute(393)
            ),
            subitem: item, count: 1
        )

        return group
    }

    private func getTrendStockCardGroup() -> NSCollectionLayoutGroup {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(244),
                heightDimension: .absolute(284)
            )
        )

        item.contentInsets = NSDirectionalEdgeInsets(
            top: 16.0,
            leading: 19.0,
            bottom: 32,
            trailing: 5.0
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(244),
                heightDimension: .absolute(284)
            ),
            subitem: item, count: 1
        )

        return group
    }

    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(30)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading
        )
        return sectionHeader
    }
}

extension TradeIdeaViewController {
    @objc func pushQuickTicketScreen(_ sender: UITapGestureRecognizer) {
        let controller = TradeIdeaOperationViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(pushQuickTicketScreen(_:)),
            name: NSNotification.Name("PushBoletaController"),
            object: nil
        )
    }
}
