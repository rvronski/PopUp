//
//  ViewController.swift
//  PopUp
//
//  Created by Roman Vronsky on 13/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PopUpTableViewCell.self, forCellReuseIdentifier: PopUpTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubviews(tableView)
        tableView.snp.makeConstraints({ v in
            v.edges.equalToSuperview()
        })
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
    
}


