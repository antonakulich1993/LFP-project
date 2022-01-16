//
//  ProfileInfoViewController.swift
//  LFP-project
//
//  Created by MacBook on 20.12.21.
//

import UIKit
import SnapKit

class ProfileInfoViewController: UIViewController {
    
    let userImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person"))
        image.layer.cornerRadius = 22
        return image
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        return tableView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone number"
        return label
    }()
    
    let allMyPartiesLabel: UILabel = {
        let label = UILabel()
        label.text = "Игры в которых вы участвуете:"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view.backgroundColor = .white
        usernameLabel.text = DefaultsManager.username
        configureInterface()
    }
    
    
    func configureInterface() {
        
        view.addSubview(userImage)
        userImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(98)
            make.leading.trailing.equalToSuperview().inset(148)
            make.width.height.equalTo(80)
        }
        
        view.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(userImage)
            make.top.equalTo(userImage.snp.bottom).offset(10)
        }
        
        view.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { make in
            make.centerX.equalTo(usernameLabel)
            make.top.equalTo(usernameLabel.snp.bottom).offset(10)
        }
        
        
      
        
        view.addSubview(allMyPartiesLabel)
        allMyPartiesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(280)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(allMyPartiesLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(0)
        }
    }
}

extension ProfileInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
}
