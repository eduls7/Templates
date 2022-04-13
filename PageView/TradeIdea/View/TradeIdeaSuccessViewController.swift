//
//  TradeIdeaSuccessViewController.swift
//  PageView
//
//  Created by Eduardo Lima on 08/02/22.
//

import UIKit

class TradeIdeaSuccessViewController: UIViewController {
    private let sharedView = TradeIdeaSuccessView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        sharedView.delegate = self
        setupNotification()
    }

    override func loadView() {
        self.view = sharedView
    }
}

extension TradeIdeaSuccessViewController {
    private func setupNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(presentInfoAlert),
            name: NSNotification.Name("tappedInfo"),
            object: nil
        )
    }

    @objc
    private func presentInfoAlert() {
        let controller = AlertViewController(alertType: .term)
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        controller.setTextsForTerm(
            title: "CBLC",
            description: "Sua identificação de cliente na bolsa."
        )
        present(controller, animated: true)
    }
}

extension TradeIdeaSuccessViewController: TradeIdeaSuccessDelegate {
    func popRootViewController() {
        navigationController?.popToRootViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
