//
//  PlayersViewController.swift
//  LFP-project
//
//  Created by MacBook on 23.12.21.
//

import UIKit
import SnapKit

class PlayersViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: PlayersViewCell.self), bundle: nil), forCellReuseIdentifier: PlayersViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
    }
}

extension PlayersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayersViewCell.identifier, for: indexPath)
        return cell
    }
    
    
}
