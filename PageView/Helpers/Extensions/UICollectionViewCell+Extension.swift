//
//  UICollectionViewCell.swift
//  PageView
//
//  Created by Eduardo Lima on 03/02/22.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    /// Returns the UITableViewCell identifier.
    class var identifier: String {
        return String(describing: self)
    }
}
