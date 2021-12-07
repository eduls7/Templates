//
//  Extension.swift
//  PageView
//
//  Created by Eduardo  on 19/07/21.
//

import UIKit

extension UITableViewCell {
    /// Returns the UITableViewCell identifier.
    class var identifier: String {
        return String(describing: self)
    }
}
