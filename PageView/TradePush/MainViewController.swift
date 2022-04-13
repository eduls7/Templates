//
//  MainViewController.swift
//  PageView
//
//  Created by Eduardo Lima on 13/10/21.
//

import UIKit
import OramaUI

class MainViewController: UIViewController {

    let sharedView = TradePushEmpyRecommendations()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Estratégia de investimento"
    }

    override func loadView() {
        view = sharedView
    }
}

extension MainViewController {

    private func setupRightButton() {
        self.view.backgroundColor = .lightGray
        self.title = "Trade Push"

        let notificationButton = SSBadgeButton()
        notificationButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        notificationButton.setImage(UIImage(named: "NotificationBell")?.withRenderingMode(.alwaysOriginal), for: .normal)
        notificationButton.badgeEdgeInsets = UIEdgeInsets(top: 37, left: 0, bottom: 0, right: 40)
        notificationButton.badge = "4"

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationButton)
        notificationButton.addTarget(self, action: #selector(didTapRightButton), for: .touchUpInside)
    }
    
    @objc
    func didTapRightButton() {
        let controller = TradePushNotificationViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
