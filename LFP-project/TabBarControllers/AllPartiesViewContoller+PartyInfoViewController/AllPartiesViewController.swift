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
        tableView.separatorStyle = .none
        tableView.refreshControl = myRefreshControl
        tableView.register(UINib(nibName: String(describing: AllPartiesViewCell.self), bundle: nil), forCellReuseIdentifier: AllPartiesViewCell.identifier)
        return tableView
    }()
    
    let myRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Обновление групп")
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Все игры"
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        if DefaultsManager.id == self.parties[indexPath.row].partymaker {
            let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
                let delete = UIAction(title: "Delete",
                                      image: UIImage(systemName: "trash"),
                                      identifier: nil,
                                      discoverabilityTitle: nil,
                                      attributes: .destructive,
                                      state: .off) { _ in
                    
                    let id = self.parties[indexPath.row].id
                    guard let url = URL(string: "https://lfp.monster/api/party/\(id)/") else { return }
                    guard let token = DefaultsManager.token else { return }
                    var request = URLRequest(url: url)
                    request.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
                    request.httpMethod = "DELETE"
                    let session = URLSession.shared
                    session.dataTask(with: request) { data, response, error in
                        guard  error == nil else {
                            print(error!)
                            return
                        }
                        guard let httpResponse = response as? HTTPURLResponse else { return print("Error")
                        }
                        if httpResponse.statusCode == 204 {
                            DispatchQueue.main.async {
                                self.parties.remove(at: indexPath.row)
                                tableView.deleteRows(at: [indexPath], with: .left)
                                self.tableView.reloadData()
                            }
                        }
                    }.resume()
                }
                let edit = UIAction(title: "edit", image: UIImage(systemName: "pencil.and.ellipsis.rectangle"), identifier: nil,
                                    discoverabilityTitle: nil, state: .off) { _ in
                    print("Tapped")
                }
                let close = UIAction(title: "close",
                                     image: UIImage(systemName: "xmark.circle"),
                                     identifier: nil, discoverabilityTitle: nil,
                                     state: .off) { _ in
                    print("Tapped")
                }
                return UIMenu(title: "",
                              image: nil,
                              identifier: nil,
                              options: UIMenu.Options.displayInline,
                              children: [ delete, edit, close ])
            }
            return configuration
        } else {
            return nil
        }
    }
}


