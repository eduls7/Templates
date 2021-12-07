//
//  VariableIncomeViewController.swift
//  PageView
//
//  Created by Eduardo Jr on 26/05/21.
//

import UIKit

class VariableIncomeViewController: UIViewController {
    // MARK: - Properties
    let shareView = VariableIncomeQuickTicketConfirmView()
    
    // MARK: - LifeCycle View
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = shareView
    }
    
    override func viewDidLayoutSubviews() {
        let colorTop =  UIColor(red: 0.486, green: 0.765, blue: 0.243, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.388, green: 0.616, blue: 0.192, alpha: 1.0).cgColor
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [colorTop, colorBottom]
//        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.frame = CGRect(
//            x: 0,
//            y: 0,
//            width: shareView.contentView.frame.size.width,
//            height: shareView.contentView.frame.size.height)
//        
//        shareView.contentView.layer.insertSublayer(gradientLayer, at: 0)
        
        let gradient = CAGradientLayer()
        gradient.colors = [colorTop, colorBottom]
        gradient.locations = [0.0, 1.0]
        gradient.frame = CGRect(
            x: 0,
            y: 0,
            width: shareView.frame.size.width,
            height: shareView.frame.size.height)
        shareView.layer.insertSublayer(gradient, at: 0)
        
        
        print("width: \(UIScreen.main.bounds.width)")
        print("height scroll: \(shareView.scrollView.frame.size.height)")
        print("height contentview: \(shareView.contentView.frame.size.height)")
    }
}
