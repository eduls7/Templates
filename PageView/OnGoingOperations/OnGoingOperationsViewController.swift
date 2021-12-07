//
//  OnGoingOperationsViewController.swift
//  PageView
//
//  Created by Eduardo  on 19/07/21.
//

import UIKit

struct model {
    let isTrue: Bool
    
    init(value: Bool) {
        self.isTrue = value
    }
}
class OnGoingOperationsViewController: UIViewController {
    
    // MARK: - Properties
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(OnGoingOperationsViewCell.self, forCellReuseIdentifier: OnGoingOperationsViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        return tableView
    }()
    
    var m: [model] = []
    //let alertView = OnGoingOperationsView()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        //alertView.delegate = self
        setupModel()
        setupContraints()
    }
}

// MARK: - Custom Methods
extension OnGoingOperationsViewController: OngoingOperationAlertViewDelegate {
    
    func didTapCancelButton(alertType: AlertType) {
        let viewController = AlertViewController(alertType: .exclusion)
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true)
        print("tap in cancel button")
    }
    
    func setupModel() {
        for _ in 0..<3 {
            let mod: model = model.init(value: true)
            self.m.append(mod)
        }
        
        for _ in 0..<4 {
            let mod: model = model.init(value: false)
            self.m.append(mod)
        }
    }
    private func setupContraints() {
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension OnGoingOperationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return m.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(
                withIdentifier: OnGoingOperationsViewCell.identifier,
                                for: indexPath) as! OnGoingOperationsViewCell
        cell.cardView.delegate = self
        
        cell.setupCell(model: m[indexPath.row])
        
        return cell
    }
}
