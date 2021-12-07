//
//  TradePushViewController.swift
//  PageView
//
//  Created by Eduardo  on 28/09/21.
//

import UIKit

class TradePushNotificationViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(
            TradePushNotificationTableViewCell.self,
            forCellReuseIdentifier: TradePushNotificationTableViewCell.identifier
        )
        
        tableView.register(
            TradePushEmpyNotificationTableViewCell.self,
            forCellReuseIdentifier: TradePushEmpyNotificationTableViewCell.identifier
        )
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notificações"
        self.view.backgroundColor = .white
        setupView()
    }

}

extension TradePushNotificationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TradePushNotificationTableViewCell.identifier,
            for: indexPath) as! TradePushNotificationTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let controller = TradePushEstrategyViewController()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        guard let navBar = navigationController?.navigationBar.bounds.height else { return 0.0 }
//        print(navBar)
//        return self.tableView.frame.height - navBar
//    }
    
}

// MARK: - Custom Methods
extension TradePushNotificationViewController {
    
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

