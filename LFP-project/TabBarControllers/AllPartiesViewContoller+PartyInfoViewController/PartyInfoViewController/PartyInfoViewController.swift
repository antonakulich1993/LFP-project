//
//  PartyInfoViewController.swift
//  LFP-project
//
//  Created by MacBook on 22.12.21.
//

import UIKit
import SnapKit

class PartyInfoViewController: UIViewController {
    
    private let party: AllPartiesModel

    init(party: AllPartiesModel) {
        self.party = party
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let partySegmentControl: UISegmentedControl = {
        let partySegmentControl = UISegmentedControl(items: ["Игроки","О игре"])
        partySegmentControl.selectedSegmentIndex = 0
        partySegmentControl.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 1.0, alpha: 1.0)
        return partySegmentControl
    }()
    
    let childView: UIView = {
        let view = UIView()
        return view
    }()
    
    var navItem: UIBarButtonItem = {
        return UIBarButtonItem()
    }()
    
    var playersViewConrtoller: PlayersViewController?
    var gameInfoViewController = UIViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navItem = UIBarButtonItem(title: "Вступить в игру", style: .plain, target: self, action: #selector(joinParty))
        navigationItem.rightBarButtonItem = navItem
        configureInterface()
        addChildPlayersViewController()
    }
    
    func configureInterface() {
        view.addSubview(partySegmentControl)
        partySegmentControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(40)
            make.top.equalToSuperview().offset(100)
        }
        partySegmentControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        
        view.addSubview(childView)
        childView.snp.makeConstraints { make in
            make.top.equalTo(partySegmentControl.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    @objc func joinParty() {
        guard let url = URL(string: "https://lfp.monster/api/party/\(party.id)/join") else { return }
        guard let token = DefaultsManager.token else { return }
        
        var request = URLRequest(url: url)
        request.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.httpMethod = "POST"
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else { return print("Error")
            }
            if httpResponse.statusCode == 201  {
                DispatchQueue.main.async {
                    self.navItem.title = "Покинуть группу"
                    self.navItem.tintColor = .red
                    self.playersViewConrtoller?.getPlayer()
                }
                return print("Error: \(httpResponse.statusCode)")
            } else if httpResponse.statusCode == 204 {
                DispatchQueue.main.async {
                    self.navItem.title = "Вступить в группу"
                    self.navItem.tintColor = .systemBlue
                    self.playersViewConrtoller?.getPlayer()
                }
            }
        }.resume()
    }
    
    func addChildPlayersViewController() {
        gameInfoViewController.didMove(toParent: self)
        gameInfoViewController.willMove(toParent: nil)
        gameInfoViewController.removeFromParent()
        gameInfoViewController.view.removeFromSuperview()
        let viewController = PlayersViewController(party: party)
        playersViewConrtoller = viewController
        guard let playersViewConrtoller = playersViewConrtoller else { return }
        playersViewConrtoller.delegate = self
        addChild(playersViewConrtoller)
        childView.addSubview(playersViewConrtoller.view)
        print("add Player")
    }
    
    func addChildPartyViewController() {
        guard let playersViewConrtoller = playersViewConrtoller else { return }
        playersViewConrtoller.didMove(toParent: self)
        playersViewConrtoller.willMove(toParent: nil)
        playersViewConrtoller.removeFromParent()
        playersViewConrtoller.view.removeFromSuperview()
        let viewController = GameInfoViewController(party: party)
        gameInfoViewController = viewController
        addChild(gameInfoViewController)
        childView.addSubview(gameInfoViewController.view)
        print("add Game")
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        switch (partySegmentControl.selectedSegmentIndex) {
        case 0:
            addChildPlayersViewController()
            break
        case 1:
            addChildPartyViewController()
            break
        default:
            break
        }
    }
}

extension PartyInfoViewController: ChangeButtonDelegate {
    func changeButtonTitle() {
        navItem.title = "Покинуть группу"
        navItem.tintColor = .red
    }
}
