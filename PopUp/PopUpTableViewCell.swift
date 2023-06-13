//
//  PopUpTableViewCell.swift
//  PopUp
//
//  Created by Roman Vronsky on 13/06/23.
//

import UIKit
import SnapKit

class PopUpTableViewCell: UITableViewCell {

    static let identifier = "PopUpCell"
    
    private lazy var accountImageView: UIImageView = {
       let view = UIImageView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.1
        view.layer.borderColor = UIColor.black.cgColor
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private lazy var accountLabel = CustomLabel(inform: "Банковский счет", size: 20, weight: .bold, color: .black)
    private lazy var numberOfAccountLabel = CustomLabel(inform: "№ 3435339", size: 17, weight: .regular, color: .black)
    private lazy var sumLabel = CustomLabel(inform: "0 с.", size: 15, weight: .light, color: .black)
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.addSubview(accountImageView)
        self.contentView.addSubview(accountLabel)
        self.contentView.addSubview(numberOfAccountLabel)
        self.contentView.addSubview(sumLabel)
        
        accountImageView.snp.makeConstraints({ v in
            v.top.bottom.equalToSuperview().inset(3)
            v.left.equalToSuperview().offset(16)
            v.width.equalToSuperview().multipliedBy(0.245333)
            v.height.equalTo(self.accountImageView.snp.width).multipliedBy(0.652)
        })
        
        accountLabel.snp.makeConstraints({ v in
            v.left.equalTo(self.accountImageView.snp.right).offset(12)
            v.top.equalToSuperview()
        })
        numberOfAccountLabel.snp.makeConstraints({ v in
            v.left.equalTo(self.accountImageView.snp.right).offset(12)
            v.top.equalTo(self.accountLabel.snp.bottom).offset(1)
        })
        sumLabel.snp.makeConstraints({ v in
            v.left.equalTo(self.accountImageView.snp.right).offset(12)
            v.top.equalTo(self.numberOfAccountLabel.snp.bottom).offset(2)
        })
    }
}
