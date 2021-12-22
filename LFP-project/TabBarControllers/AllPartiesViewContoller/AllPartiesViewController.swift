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
        tableView.register(UINib(nibName: String(describing: AllPartiesViewCell.self), bundle: nil), forCellReuseIdentifier: AllPartiesViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getParties()
    }
    

//    return ["Authorization": "Token \(savedToken)"]
    func getParties() {
//        guard let url = URL(string: "https://lfp.monster/api/party/") else { return }
        guard let token = DefaultsManager.token else { return }
        var components = URLComponents()
        components.host = "https"
        components.host = "lfp.monster"
        components.path = "/api/party/"
        components.queryItems = [
            URLQueryItem(name: "Authorisation", value: "token \(token)")
        ]
        guard let url = components.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else { return print("Error")}
            guard httpResponse.statusCode == 200 else {
                return print("Error: \(httpResponse.statusCode)")
            }
            
            guard let data = data else { return }
            
            let result = try? JSONDecoder().decode([AllPartiesModel].self, from: data)
            guard let result = result else { return }
            self.parties = result
        }.resume()
    }
}

extension AllPartiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AllPartiesViewCell.identifier, for: indexPath) as? AllPartiesViewCell else { return UITableViewCell()}
        return cell
    }
}
