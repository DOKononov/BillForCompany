//
//  MainVC.swift
//  BillForCompany
//
//  Created by Dmitry Kononov on 20.08.22.
//

import UIKit
import SnapKit

protocol MainVCDelegate {
    var viewModel: MainViewProtocol {get set}
}

class MainVC: UIViewController, MainVCDelegate {
    
    var viewModel: MainViewProtocol = MainViewModel()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter the invoice amount and click \"Calculate\""
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculateDidPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let totalBillView = TotalBillView()
    private let personsView = PersonsView()
    private let tipsView = TipsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        delegate()
        totalBillView.summTextField.becomeFirstResponder()
    }
    
    private func delegate() {
        tipsView.delegate = self
        personsView.delegate = self
        totalBillView.delegate = self
    }
    
    private func setupViews() {
        titleLabel.font = UIFont.systemFont(ofSize: view.frame.height * 0.046, weight: .light)
        view.backgroundColor = #colorLiteral(red: 0.9813271165, green: 0.9813271165, blue: 0.9813271165, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(logoImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
        view.addSubview(calculateButton)
        view.addSubview(tipsView)
    }
    
    @objc private func calculateDidPressed() {
        showAlert(title: "Bill per person:", message: viewModel.calcResult(), preferredStyle: .alert)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

//constraints
extension MainVC {
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalTo(view.snp.centerX)
            make.height.width.equalTo(view.snp.height).multipliedBy(0.2)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        
        totalBillView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(totalBillView.snp.width).multipliedBy(0.28)
        }
        
        personsView.snp.makeConstraints { make in
            make.top.equalTo(totalBillView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(personsView.snp.width).multipliedBy(0.28)
        }
        
        tipsView.snp.makeConstraints { make in
            make.top.equalTo(personsView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(tipsView.snp.width).multipliedBy(0.28)
        }
        
        calculateButton.snp.makeConstraints { make in
            make.top.equalTo(tipsView.snp.bottom).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(personsView.snp.height).multipliedBy(0.5)
        }
    }
}


