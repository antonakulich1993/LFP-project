//
//  AllPartiesViewController.swift
//  LFP-project
//
//  Created by MacBook on 20.12.21.
//

import UIKit
import SnapKit


class AllPartiesViewController: UIViewController {
    
    var parties: [AllPartiesModel] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = myRefreshControl
        tableView.register(UINib(nibName: String(describing: AllPartiesViewCell.self), bundle: nil), forCellReuseIdentifier: AllPartiesViewCell.identifier)
        tableView.estimatedRowHeight = 130
        return tableView
    }()
    
    let myRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Обновление групп")
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
        getParties()
        myRefreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
    }
    
    func configureInterface() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func getParties() {
        
        guard let url = URL(string: "https://lfp.monster/api/party/") else { return }
        guard let token = DefaultsManager.token else { return }
        var request = URLRequest(url: url)
        request.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else { return print("Error")}
            guard httpResponse.statusCode == 200 else {
                return print("Error: \(httpResponse.statusCode)")
            }
            
            guard let data = data else { return }
            
            let result = try? JSONDecoder().decode([AllPartiesModel].self, from: data)
            guard let result = result else { return }
            self.parties = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
    }
    
    @objc private func refresh(sender: UIRefreshControl) {
        getParties()
        sender.endRefreshing()
    }
}

extension AllPartiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AllPartiesViewCell.identifier, for: indexPath) as? AllPartiesViewCell else { return UITableViewCell()}
        cell.setupCell(parties: parties[indexPath.row])
        return cell
    }
}

extension AllPartiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let party = parties[indexPath.row]
        let partyInfo = PartyInfoViewController(party: party)
        navigationController?.pushViewController(partyInfo, animated: true)
        
    }
}
