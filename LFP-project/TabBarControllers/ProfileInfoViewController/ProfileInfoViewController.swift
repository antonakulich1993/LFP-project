//
//  ProfileInfoViewController.swift
//  LFP-project
//
//  Created by MacBook on 20.12.21.
//

import UIKit
import SnapKit

class ProfileInfoViewController: UIViewController {
    
    var parties: [AllPartiesModel] = []
    var sortedParties = [Any]()
    
    let userImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person"))
        image.layer.cornerRadius = 22
        return image
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: ProfileInfoViewCell.self), bundle: nil), forCellReuseIdentifier: ProfileInfoViewCell.identifier)
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
    
    let logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выйти", for: .normal)
        button.tintColor = .red
        return button
    }()
    
    var navItemRight: UIBarButtonItem = {
        return UIBarButtonItem()
    }()
    var navItemLeft: UIBarButtonItem = {
        return UIBarButtonItem()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        getParties()
        configureInterface()
    }
    
    
    func configureInterface() {
        
        view.backgroundColor = .white
        
        usernameLabel.text = DefaultsManager.username
        
        navItemRight = UIBarButtonItem(title: "Выйти", style: .plain, target: self, action: #selector(logOutAction))
        navigationItem.rightBarButtonItem = navItemRight
        navItemRight.tintColor = .red
        
        navItemLeft = UIBarButtonItem(title: "Редактировать", style: .plain, target: self, action: #selector(editProfile))
        navigationItem.leftBarButtonItem = navItemLeft
        navItemLeft.tintColor = .systemBlue
        
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
    @objc func editProfile() {
        let profileSettingsVC = ProfileSettingsViewController()
        profileSettingsVC.delegate = self
        navigationController?.pushViewController(profileSettingsVC, animated: true)
    }
    
    @objc func logOutAction() {
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "id")
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let appDelegateWindow = appDelegate?.window
        appDelegateWindow?.rootViewController?.dismiss(animated: false)
        appDelegateWindow?.rootViewController = UINavigationController(rootViewController: LoginViewController())
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
}

extension ProfileInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileInfoViewCell.identifier, for: indexPath) as? ProfileInfoViewCell else { return  UITableViewCell()}
        cell.setupCell(parties: parties[indexPath.row])
        return cell
    }
}

extension ProfileInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension ProfileInfoViewController: ChangeUserSettingsDelegate {
    func didChange(user: User) {
        phoneLabel.text = user.phone
    }
}
