//
//  PlayersViewController.swift
//  LFP-project
//
//  Created by MacBook on 23.12.21.
//

import UIKit
import SnapKit

protocol ChangeButtonDelegate: AnyObject {
    func changeButtonTitle()
}

class PlayersViewController: UIViewController {
    
    private let party: AllPartiesModel
    
    weak var delegate: ChangeButtonDelegate?
    
    init(party: AllPartiesModel) {
        self.party = party
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var players: [String] = []
    var joinedPlayers = 0
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: PlayersViewCell.self), bundle: nil), forCellReuseIdentifier: PlayersViewCell.identifier)
        return tableView
    }()
    
    let myRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Обновление игроков")
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
        getPlayer()
        myRefreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
    }
    
    func configureInterface() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
    }
    
    func getPlayer() {
        guard let url = URL(string: "https://lfp.monster/api/party/\(party.id)/") else { return }
        guard let token = DefaultsManager.token else { return }
        guard let username = DefaultsManager.username else { return }
        
        var request = URLRequest(url: url)
        request.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else { return
                print("Error")
            }
            guard httpResponse.statusCode == 200 else { return
                print("Error: \(httpResponse.statusCode)")
            }
            guard let data = data else {
                return
            }
            let result = try! JSONDecoder().decode(PlayersModel.self, from: data)
            self.players = result.usernames
            self.joinedPlayers = result.joinedUsers
            DispatchQueue.main.async {
                if self.players.contains(username) {
                    self.delegate?.changeButtonTitle()
                }
                self.tableView.reloadData()
            }
        }.resume()
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        getPlayer()
        sender.endRefreshing()
    }
}

extension PlayersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return joinedPlayers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayersViewCell.identifier, for: indexPath) as? PlayersViewCell else { return UITableViewCell()}
        cell.playerLabel.text = players[indexPath.row]
        return cell
    }
}
