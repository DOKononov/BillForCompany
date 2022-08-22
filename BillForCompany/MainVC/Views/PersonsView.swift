//
//  PersonsView.swift
//  BillForCompany
//
//  Created by Dmitry Kononov on 21.08.22.
//

import UIKit


final class PersonsView: UIView {
    
    var delegate: MainVCDelegate?
            
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Persons"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("−", for: .normal)
        button.tintColor = #colorLiteral(red: 0.4510066509, green: 0.4966486692, blue: 0.5633206367, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 60, weight: .light)
        button.addTarget(self, action: #selector(minusButtonDidTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.tintColor = #colorLiteral(red: 0.4510066509, green: 0.4966486692, blue: 0.5633206367, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 60, weight: .light)
        amountLabel.text = "2"
        button.addTarget(self, action: #selector(plusButtonDidTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 48, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(backView)
        backView.addSubview(minusButton)
        backView.addSubview(plusButton)
        backView.addSubview(amountLabel)
    }
    
    @objc  func minusButtonDidTapped() {
        amountLabel.text =  delegate?.viewModel.minusButtonDidTapped(minusButton, plusButton)
    }
    
    @objc private func plusButtonDidTapped() {
        amountLabel.text = delegate?.viewModel.plusButtonDidTapped(plusButton, minusButton)
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.height.equalTo(self.snp.height).multipliedBy(0.2).priority(.low)
        }
        
        backView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(0)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        minusButton.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.height.width.equalTo(backView.snp.height)
        }
        
        plusButton.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview()
            make.height.width.equalTo(backView.snp.height)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.leading.equalTo(minusButton.snp.trailing).offset(8)
            make.trailing.equalTo(plusButton.snp.leading).offset(-8)
            make.top.bottom.equalToSuperview().offset(8)
        }
    }
    
}
