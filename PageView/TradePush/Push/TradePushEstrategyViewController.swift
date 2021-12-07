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
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showAlertView(_:)),
            name: NSNotification.Name("alertView.com"),
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateContinueButton(_:)),
            name: NSNotification.Name("ContinueButton.com"),
            object: nil
        )
        
        self.title = "Estratégias de Investimento"
        fillArray()
        setupView()
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
            cell.checkBox.tag = indexPath.row
            if indexPath.row == 1 {
                cell.setupCell(viewType: .buy)
            } else {
                cell.setupCell(viewType: .sell)
            }
            
            return cell
        }
    }
    
}

extension TradePushEstrategyViewController {
    
    @objc
    func showAlertView(_ notification: Notification) {
        guard let viewType = (notification.userInfo?["alertType"]) as? AlertType else { return }
        let viewController = AlertViewController(alertType: viewType)
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true)
    }
    
    @objc
    func deleteButtonTouched() {
        print("touched")
    }
    
    @objc
    func updateContinueButton(_ notification: Notification) {
        let operationCheckBox = (
            notification.userInfo?["operationCheckBoxState"]
        ) as? ORCheckBox
        
        var termCheckBoxState = (
            notification.userInfo?["termCheckBoxState"]
        ) as? ORCheckBox.CheckBoxState
        
        var operationState = operationCheckBox?.getState()
    
        for element in elements where element is TradePushEstrategyTableViewCell {
            let operationEstrategy = element as! TradePushEstrategyTableViewCell
            if operationEstrategy.checkBox.getState() == .checked {
                operationState = .checked
                break
            }
        }
        
        if termCheckBoxState == nil {
            for element in elements where element is TradePushTermTableViewCell {
                let termView = element as! TradePushTermTableViewCell
                if termView.checkBox.getState() == .checked {
                    termCheckBoxState = .checked
                }
            }
        }
                
        let marks = (termCheckBoxState, operationState)
        
        switch marks {
        case (.checked, .checked):
            self.termView.confirmButton.isEnabled = true
        default:
            self.termView.confirmButton.isEnabled = false
        }
        
//        if let checkBox = operationCheckBox {
//            for element in elements where element is TradePushEstrategyTableViewCell {
//                let operationEstrategy = element as! TradePushEstrategyTableViewCell
//                if operationEstrategy.checkBox.tag == checkBox.tag {
//                    switch operationEstrategy.checkBox.getState() {
//
//                    case .checked:
//                        self.operations.append(operationEstrategy)
//                    case .unchecked:
//                        let tag = checkBox.tag
//                        self.operations.remove(at: checkBox.tag)
//                    }
//                }
//            }
//        }
    }
}

// MARK: - Custom Methods
extension TradePushEstrategyViewController {
    private func fillArray() {
        elements.append(TradePushHeaderTableViewCell())
        elements.append(TradePushEstrategyTableViewCell())
        elements.append(TradePushEstrategyTableViewCell())
        elements.append(TradePushEstrategyTableViewCell())
        elements.append(TradePushEstrategyTableViewCell())
        self.termView.confirmButton.isEnabled = true
        elements.append(termView)
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
