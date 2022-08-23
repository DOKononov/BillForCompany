//
//  VC+alert.swift
//  BillForCompany
//
//  Created by Dmitry Kononov on 23.08.22.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String?, message: String?, preferredStyle: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let okButton = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(okButton)
        self.present(alertController, animated: true)
    }
}
