//
//  MainViewController.swift
//  PageView
//
//  Created by Eduardo Lima on 13/10/21.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.title = "Trade Push"
        
        let notificationButton = SSBadgeButton()
        notificationButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        notificationButton.setImage(UIImage(named: "NotificationBell")?.withRenderingMode(.alwaysOriginal), for: .normal)
        notificationButton.badgeEdgeInsets = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 40)
        notificationButton.badge = "4"

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationButton)
        notificationButton.addTarget(self, action: #selector(didTapRightButton), for: .touchUpInside)
        
//        let image = UIImage(
//            named: "NotificationBell")?
//            .withRenderingMode(.alwaysOriginal)
//
//        let rightButton = UIBarButtonItem(
//            image: image,
//            style: .plain,
//            target: self,
//            action: #selector(didTapRightButton)
//        )
//
//        navigationItem.rightBarButtonItem = rightButton
    }

}

extension MainViewController {
    
    @objc
    func didTapRightButton() {
        let controller = TradePushNotificationViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
