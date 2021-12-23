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
        partySegmentControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        return partySegmentControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(partySegmentControl)
        partySegmentControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(40)
            make.top.equalToSuperview().offset(100)
        }
    }
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        switch (partySegmentControl.selectedSegmentIndex) {
        case 0:
           print("0")
            break
        case 1:
            print("1")
            break
        default:
            break
        }
    }
}


