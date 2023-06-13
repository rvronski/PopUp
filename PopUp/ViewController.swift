//
//  ViewController.swift
//  PopUp
//
//  Created by Roman Vronsky on 13/06/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(PopUpTableViewCell.self, forCellReuseIdentifier: PopUpTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.separatorStyle = .none
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        self.view.backgroundColor = .white
        self.view.layer.cornerRadius = 25
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints({ v in
            v.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            v.left.right.bottom.equalToSuperview()
        })
        let rightButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismis))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func dismis() {
        self.dismiss(animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopUpTableViewCell.identifier, for: indexPath) as! PopUpTableViewCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


