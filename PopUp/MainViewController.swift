//
//  MainViewController.swift
//  PopUp
//
//  Created by ROMAN VRONSKY on 13.06.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var button: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .systemBlue
        button.setTitle("Pop", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(push), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(button)
        button.snp.makeConstraints({ v in
            v.centerX.centerY.equalToSuperview()
            v.height.equalTo(40)
            v.width.equalTo(150)
        })
        
    }
    @objc func push() {
        let vc = ViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .pageSheet
        let sheet = nav.sheetPresentationController
        sheet?.detents = [.medium(), .large()]
        present(nav, animated: true)
        
    }
}
