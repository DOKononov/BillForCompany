//
//  MainViewModel.swift
//  BillForCompany
//
//  Created by Dmitry Kononov on 20.08.22.
//

import Foundation
import UIKit

protocol MainViewProtocol {
    var personsCounter: Int { get set }
    var tipsArray: [String] {get}
    var tipsCount: Double {get set}
    var totalBill: Double {get set}
    func didSelectItemAt(indexPath: IndexPath)
    func minusButtonDidTapped(_ minus: UIButton, _ plus: UIButton) -> String
    func plusButtonDidTapped(_ plus: UIButton, _ minus: UIButton) -> String
    func calcResult() -> String
}

final class MainViewModel: MainViewProtocol {
    
    var totalBill: Double = 0
    
    var tipsCount: Double = 0
    var personsCounter: Int = 2
    var tipsArray = ["0%", "10%", "15%", "20%"]

    func didSelectItemAt(indexPath: IndexPath) {
        switch indexPath.row {
        case 1: tipsCount = 0.1
        case 2: tipsCount = 0.15
        case 3: tipsCount = 0.20
        default: tipsCount = 0
        }
    }
    
    func minusButtonDidTapped(_ minus: UIButton, _ plus: UIButton) -> String {
        personsCounter > 2 ? personsCounter -= 1 : (minus.isEnabled = false)
        plus.isEnabled = true
        return "\(personsCounter)"
    }
    
    func plusButtonDidTapped(_ plus: UIButton, _ minus: UIButton) -> String {
        personsCounter < 20 ? personsCounter += 1 : (plus.isEnabled = false)
        minus.isEnabled = true
        return "\(personsCounter)"
    }
    
    func calcResult() -> String {
        if personsCounter != 0 {
            return String(((totalBill + totalBill * tipsCount )  / Double(personsCounter)).myRound())
        } else {
            return "Error! persons == nil"
        }
    }
    
}
