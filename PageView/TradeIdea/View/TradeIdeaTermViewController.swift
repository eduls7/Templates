//
//  TradeIdeaTermViewController.swift
//  PageView
//
//  Created by Eduardo Lima on 10/03/22.
//

import UIKit
import OramaUI

class TradeIdeaTermViewController: UIViewController {
    let sharedView = TradeIdeaTermView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Termo de Desenquadramento"
    }

    override func loadView() {
        view = sharedView
    }
}
