//
//  AlertViewController.swift
//  PageView
//
//  Created by Eduardo  on 14/09/21.
//

import UIKit

enum AlertType {
    case exclusion
    case eletronicSignature
    case term
}
 
// MARK: - Main
class AlertViewController: UIViewController {
    
//    private var alertView = StockExchangeAlertView()
    private var alertView = AlertTermView()
    let viewType: AlertType
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        switch viewType {
        
        case .exclusion:
            let alertView = AlertFeedbackView()
            alertView.delegate = self
            view = alertView
        case .eletronicSignature:
            let alertView = AlertEletronicSignatureView()
            alertView.delegate = self
            alertView.eletronicSignatureTextField.delegate = self
            view = alertView
        case .term:
            let alertView = AlertTermView()
            alertView.delegate = self
            view = alertView
        }
    }
    
    init(alertType: AlertType) {
        self.viewType = alertType
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UITextFieldDelegate
extension AlertViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
// MARK: - Delegates Alerts
extension AlertViewController: AlertFeedbackDelegate, AlertEletronicSignatureDelegate, AlertTermViewDelegate {
    
    func didTapCloseButton() {
        self.dismiss(animated: true)

    }
    
    func dismissAlert() {
        self.dismiss(animated: true)
    }
    
}

extension AlertViewController {

}
