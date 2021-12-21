//
//  AllPartiesViewController.swift
//  LFP-project
//
//  Created by MacBook on 20.12.21.
//

import UIKit
import SnapKit

class AllPartiesViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
//        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: AllPartiesViewCell.self), bundle: nil), forCellReuseIdentifier: AllPartiesViewCell.identifier)
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

//extension AllPartiesViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    //    return tableView
//    }
//}
