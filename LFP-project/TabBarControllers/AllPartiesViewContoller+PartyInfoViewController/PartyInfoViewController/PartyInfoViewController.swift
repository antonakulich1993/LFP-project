//
//  PartyInfoViewController.swift
//  LFP-project
//
//  Created by MacBook on 22.12.21.
//

import UIKit
import SnapKit

class PartyInfoViewController: UIViewController {
    
    let partySegmentControl: UISegmentedControl = {
        let partySegmentControl = UISegmentedControl(items: ["Игроки","О игре"])
        partySegmentControl.selectedSegmentIndex = 0
        partySegmentControl.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 1.0, alpha: 1.0)
        return partySegmentControl
    }()
    
    let childView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    var playersViewConrtoller = UIViewController()
    var gameInfoViewController = UIViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureInterface()
        configurePlayersViewController()
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
    
    func configurePlayersViewController() {
        let viewController = PlayersViewController()
        playersViewConrtoller = viewController
        addChild(playersViewConrtoller)
        childView.addSubview(playersViewConrtoller.view)
        playersViewConrtoller.didMove(toParent: self)
        print("add Player")
        
    }
    
    func configurePartyViewController() {
          let viewController = GameInfoViewController()
            gameInfoViewController = viewController
            addChild(gameInfoViewController)
            childView.addSubview(gameInfoViewController.view)
            gameInfoViewController.didMove(toParent: self)
        print("add Game")
    }
   
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        switch (partySegmentControl.selectedSegmentIndex) {
            
        case 0:
            gameInfoViewController.willMove(toParent: nil)
            gameInfoViewController.removeFromParent()
            gameInfoViewController.view.removeFromSuperview()
            configurePlayersViewController()
            break
        case 1:
            playersViewConrtoller.willMove(toParent: nil)
            playersViewConrtoller.removeFromParent()
            playersViewConrtoller.view.removeFromSuperview()
            configurePartyViewController()
            break
        default:
            break
        }
    }
}

