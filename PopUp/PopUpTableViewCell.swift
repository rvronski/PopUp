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
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.black.cgColor
        view.backgroundColor = .backgroundPrimary
        return view
    }()
    
    private lazy var accountLabel = AlifLabel(text: "Банковский счет", style: .Body2, color: .basic500)
    private lazy var numberOfAccountLabel = AlifLabel(text: "№ 3435339", style: .Body3, color: .basic300)
    private lazy var sumLabel = AlifLabel(text: "0 с.", style: .Subtitle2, color: .basic500)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        setupView()
    }
    
    private func setupView() {
        self.contentView.addSubviews(accountImageView)
        self.contentView.addSubviews(accountLabel)
        self.contentView.addSubviews(numberOfAccountLabel)
        self.contentView.addSubviews(sumLabel)
        
        accountImageView.snp.makeConstraints({ v in
            v.top.bottom.equalToSuperview()
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
