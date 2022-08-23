//
//  Double+myRound.swift
//  BillForCompany
//
//  Created by Dmitry Kononov on 23.08.22.
//

import Foundation

extension Double {
    
    func myRound() -> Double {
        return (self * 100).rounded() / 100
    }
}
