//
//  TipsCollectionViewCell.swift
//  BillForCompany
//
//  Created by Dmitry Kononov on 21.08.22.
//

import UIKit

final class TipsCollectionViewCell: UICollectionViewCell {
    
    private let percentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor =  #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    func setupCell(tipAmount: String) {
        percentLabel.text = tipAmount
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        addSubview(percentLabel)
        layer.cornerRadius = 10
    }
    
    private func setConstraints() {
        percentLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
