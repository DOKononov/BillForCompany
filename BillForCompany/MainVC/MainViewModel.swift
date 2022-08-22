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
    var tipsCount: Int {get set}
    var totalBill: Int {get set}
    func didSelectItemAt(indexPath: IndexPath)
    func minusButtonDidTapped(_ minus: UIButton, _ plus: UIButton) -> String
    func plusButtonDidTapped(_ plus: UIButton, _ minus: UIButton) -> String
}

final class MainViewModel: MainViewProtocol {
    var totalBill: Int = 0
    
    var tipsCount: Int = 0
    var personsCounter: Int = 2
    var tipsArray = ["0%", "10%", "15%", "20%"]

    func didSelectItemAt(indexPath: IndexPath) {
        switch indexPath.row {
        case 1: tipsCount = 10
        case 2: tipsCount = 15
        case 3: tipsCount = 20
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
    
    
}
