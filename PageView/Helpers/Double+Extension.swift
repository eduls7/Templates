//
//  Double+Extension.swift
//  PageView
//
//  Created by Eduardo  on 09/08/21.
//

import Foundation

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
