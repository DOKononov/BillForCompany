//
//  TotalBillView.swift
//  BillForCompany
//
//  Created by Dmitry Kononov on 20.08.22.
//

import UIKit
import SnapKit

final class TotalBillView: UIView {
    
    var delegate: MainVCDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let summTextField: UITextField = {
        let tf = UITextField(frame: .zero)
        tf.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        tf.tintColor = #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
        tf.layer.cornerRadius = 10
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 48, weight: .semibold)
        tf.text = "0.0"
        tf.textAlignment = .center
        tf.keyboardType = .decimalPad
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
        summTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(summTextField)
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.height.lessThanOrEqualTo(self.snp.height).multipliedBy(0.2)
        }
        
        summTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.greaterThanOrEqualTo(self.snp.height).multipliedBy(0.7)
        }
    }
    
}

extension TotalBillView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let str = textField.text, let bill = Double(str) {
            delegate?.viewModel.totalBill = bill.myRound()
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.viewModel.textFieldDidEndEditing(textField)
    }
}
