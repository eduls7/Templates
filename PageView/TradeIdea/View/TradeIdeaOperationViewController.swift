//
//  TradeIdeaOperationViewController.swift
//  PageView
//
//  Created by Eduardo Lima on 09/02/22.
//

import UIKit
import OramaUI

private enum TradeIdeaTextFieldType {
    case amount
    case totalInvestment
}

enum TradeIdeaRuleValidation {
    case updateToMinimumLot
    case calculateNewFieldsValues
}

final class TradeIdeaOperationViewController: UIViewController {
    private let sharedView = TradeIdeaOperationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: .backgroundGray)
//        navigationController?.navigationBar.backgroundColor = .white
        self.title = "Estratégias de Investimento"
        setupTextFields()
        setupNotificationCenter()
    }

    override func loadView() {
        self.view = sharedView
    }
}

extension TradeIdeaOperationViewController: UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField) {
////        let textFieldType: TradeIdeaTextFieldType =
////        textField == sharedView.quantityTextField ? .amount : .totalInvestment
//        if textField.isEditing {
//            print("is editing")
//            if textField == sharedView.quantityTextField {
//                sharedView.totalAmountTextField.text = "R$ 7.000,00"
//                sharedView.quantityTextField.text = "758"
//                return
//            } else {
//                sharedView.quantityTextField.text = "758"
//                sharedView.totalAmountTextField.text = "R$ 7.000,00"
//            }
//            sharedView.totalAmountTextField.setNeedsUpdatePlaceholderConstraints()
//            sharedView.quantityTextField.setNeedsUpdatePlaceholderConstraints()
//        }
//
////        redirectValidation(textField: textField, type: textFieldType)
//    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let textFieldType: TradeIdeaTextFieldType =
        textField == sharedView.quantityTextField ? .amount : .totalInvestment

        redirectValidation(textField: textField, type: textFieldType)
        sharedView.totalAmountTextField.setNeedsUpdatePlaceholderConstraints()
        sharedView.quantityTextField.setNeedsUpdatePlaceholderConstraints()
        return true
    }

    private func redirectValidation(textField: UITextField, type: TradeIdeaTextFieldType) {

        switch type {
        case .amount:
            sharedView.quantityTextField.text = "758"
            sharedView.totalAmountTextField.text = "R$ 7.000,00"
        case .totalInvestment:
            sharedView.quantityTextField.text = "0000"
            sharedView.totalAmountTextField.text = "R$ 0.000,00"
        }
    }

    private func setupTextFields() {
        sharedView.quantityTextField.delegate = self
        sharedView.totalAmountTextField.delegate = self
        sharedView.totalAmountTextField.text = "R$ 4.000,00"
        sharedView.quantityTextField.text = "100"
        sharedView.totalAmountTextField.setNeedsUpdatePlaceholderConstraints()
        sharedView.quantityTextField.setNeedsUpdatePlaceholderConstraints()
    }
}
extension TradeIdeaOperationViewController {
    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(presentEletronicSignatureAlert),
            name: NSNotification.Name("tappConfirmButton"),
            object: nil
        )
    }
}

extension TradeIdeaOperationViewController: AlertConfirmSignatureDelegate {
    func confirm(signature: String?) {
        let controller = TradeIdeaSuccessViewController()
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension TradeIdeaOperationViewController {
    @objc
    private func presentEletronicSignatureAlert() {
        let controller = AlertViewController(alertType: .eletronicSignature)
        controller.delegateSignature = self
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true)
    }
}
