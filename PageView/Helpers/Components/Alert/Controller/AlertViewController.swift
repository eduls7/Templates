//
//  AlertViewController.swift
//  Orama
//
//  Created by Eduardo Lima on 14/10/21.
//  Copyright © 2021 Órama DTVM S/A. All rights reserved.
//

import UIKit

enum AlertType {
    case exclusion
    case eletronicSignature
    case term
}

protocol AlertExclusionDelegate: AnyObject {
    func exclusion()
}

protocol AlertConfirmSignatureDelegate: AnyObject {
    func confirm(signature: String?)
}

protocol AlertForgotSignatureDelegate: AnyObject {
    func forgotEletronicSignature()
}

final class AlertViewController: UIViewController {
    // MARK: - Properties
    private let viewType: AlertType
    weak var delegateExclusion: AlertExclusionDelegate?
    weak var delegateSignature: AlertConfirmSignatureDelegate?
    weak var delegateForgotSignature: AlertForgotSignatureDelegate?

    // MARK: - Life CycleView
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(dismissAlert),
            name: NSNotification.Name("dismissAlertView.com"),
            object: nil
        )
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
            view = alertView
        case .term:
            let alertView = AlertTermView()
            view = alertView
        }
    }

    // MARK: - Initializers
    init(alertType: AlertType, tag: Int? = nil) {
        self.viewType = alertType
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    convenience required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlertViewController {
    func setAlertExclusionTitle(title: String) {
        guard let alertView = view as? AlertFeedbackView else {
            return
        }

        alertView.setAlertTitle(title)
    }
}

// MARK: - UITextFieldDelegate
extension AlertViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

// MARK: - Delegates Alerts
extension AlertViewController: AlertFeedbackDelegate, AlertEletronicSignatureDelegate {
    func didTapForgotEletronicSignature() {
        delegateForgotSignature?.forgotEletronicSignature()
    }

    func didTapContinueButton(signature: String?) {
        delegateSignature?.confirm(signature: signature)
        self.dismiss(animated: true)
    }

    func excludeRecommendation() {
        delegateExclusion?.exclusion()
        self.dismiss(animated: true)
    }

    @objc
    func dismissAlert() {
        self.dismiss(animated: true)
    }
}

extension AlertViewController {
    func setTextsForTerm(title: String, description: String) {
        guard let termView = view as? AlertTermView else { return }
        termView.titleLabel.text = title
        termView.investorProfileLabel.text = description
    }
}
