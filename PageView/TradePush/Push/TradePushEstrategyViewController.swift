//
//  TradePushViewController.swift
//  PageView
//
//  Created by Eduardo  on 28/09/21.
//

import UIKit
import OramaUI

class TradePushEstrategyViewController: UIViewController {
    // MARK:  - Properties
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(
            TradePushEstrategyTableViewCell.self,
            forCellReuseIdentifier: TradePushEstrategyTableViewCell.identifier)
        tableView.register(
            TradePushHeaderTableViewCell.self,
            forCellReuseIdentifier: TradePushHeaderTableViewCell.identifier)
        tableView.register(
            TradePushTermTableViewCell.self,
            forCellReuseIdentifier: TradePushTermTableViewCell.identifier)
        return tableView
    }()
    
    var mockArray: [Any]?
    var elements: [Any] = []
    var operations: [TradePushEstrategyTableViewCell] = []
    let termView = TradePushTermTableViewCell()
    
    // MARK: - LifeCycle View
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.backgroundColor = UIColor(named: .backgroundGray)
        
        self.title = "Estratégias de Investimento"
        fillArray()
        setupView()
        setupNotificationCenter()
    }

}

// MARK: - UITableViewDelegate And UITableViewDataSource
extension TradePushEstrategyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element = elements[indexPath.row]

        switch element {
        case is TradePushHeaderTableViewCell:
            return element as! TradePushHeaderTableViewCell
        case is TradePushTermTableViewCell:
            return element as! TradePushTermTableViewCell
        default:
            let cell = element as! TradePushEstrategyTableViewCell
            
            return cell
        }
    }
    
}

// MARK: - AlertConfirmSignatureDelegate
extension TradePushEstrategyViewController: AlertConfirmSignatureDelegate {
    func confirm(signature: String?) {
        let controller = TradeIdeaSuccessViewController()
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - Custom Methods
extension TradePushEstrategyViewController {
    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(presentEletronicSignatureAlert),
            name: NSNotification.Name("tappConfirmButton"),
            object: nil
        )
    }

    @objc
    private func presentEletronicSignatureAlert() {
        let controller = AlertViewController(alertType: .eletronicSignature)
        controller.delegateSignature = self
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true)
    }

    private func fillArray() {
//        elements.append(TradePushHeaderTableViewCell())
        elements.append(TradePushEstrategyTableViewCell())
        self.termView.confirmButton.isEnabled = true
//        elements.append(termView)
    }
    
    private func setupView() {
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
