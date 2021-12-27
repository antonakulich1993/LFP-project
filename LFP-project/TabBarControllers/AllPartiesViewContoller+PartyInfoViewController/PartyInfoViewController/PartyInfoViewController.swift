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
    
    var playersViewConrtoller = UIViewController()
    var gameInfoViewController = UIViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
    
    func addChildPlayersViewController() {
        gameInfoViewController.willMove(toParent: nil)
        gameInfoViewController.removeFromParent()
        gameInfoViewController.view.removeFromSuperview()
        let viewController = PlayersViewController()
        playersViewConrtoller = viewController
        addChild(playersViewConrtoller)
        childView.addSubview(playersViewConrtoller.view)
        playersViewConrtoller.didMove(toParent: self)
        print("add Player")
    }
    
    func addChildPartyViewController() {
        playersViewConrtoller.willMove(toParent: nil)
        playersViewConrtoller.removeFromParent()
        playersViewConrtoller.view.removeFromSuperview()
        let viewController = GameInfoViewController(party: party)
        gameInfoViewController = viewController
        addChild(gameInfoViewController)
        childView.addSubview(gameInfoViewController.view)
        gameInfoViewController.didMove(toParent: self)
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
    
    deinit {
        print(playersViewConrtoller)
        print(gameInfoViewController)
    }
}

