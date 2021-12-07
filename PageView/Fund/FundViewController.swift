//
//  ViewController.swift
//  PageView
//
//  Created by Eduardo Lima on 12/05/21.
//

import UIKit

class FundViewController: UIViewController {
    let cellRowHeight = CGFloat(202)
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        //tableView.rowHeight = cellRowHeight
        tableView.estimatedRowHeight = cellRowHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor(red: 230, green: 238, blue: 230, alpha: 1)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
}

extension FundViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension FundViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

        return cell
    }
    
}

extension FundViewController {
    func setupView() {
        view.addSubview(tableView)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

