//
//  RegistrationViewController.swift
//  LFP-project
//
//  Created by MacBook on 14.12.21.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    let registrationView: UIView = {
        let registrationView = UIView()
        registrationView.backgroundColor = .systemGray6
        registrationView.layer.shadowOffset = CGSize(width: 1, height: 1)
        registrationView.layer.shadowRadius = 5
        registrationView.layer.shadowOpacity = 0.3
        return registrationView
    }()
    
    let infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.text = "Все поля обязательны к заполнению *"
        infoLabel.numberOfLines = 0
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        infoLabel.font = infoLabel.font.withSize(13)
        return infoLabel
    }()
    
    let usernameField: UITextField = {
        let usernameField = UITextField()
        usernameField.borderStyle = .roundedRect
        usernameField.placeholder = "Имя пользователя"
        return usernameField
    }()
    
    let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.borderStyle = .roundedRect
        passwordField.placeholder = "Пароль"
        passwordField.isSecureTextEntry = true
        return passwordField
    }()
    
    let repeatPasswordField: UITextField = {
        let repeatPasswordField = UITextField()
        repeatPasswordField.borderStyle = .roundedRect
        repeatPasswordField.placeholder = "Повторите пароль"
        repeatPasswordField.isSecureTextEntry = true
        return repeatPasswordField
    }()
    
    let registrationButton: UIButton = {
        let registrationButton = UIButton()
        registrationButton.backgroundColor = .systemGreen
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.addTarget(self, action: #selector(registrationAction), for: .touchUpInside)
        registrationButton.layer.cornerRadius = 10
        return registrationButton
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configuerInterface()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Регистрация"
        view.backgroundColor = .white
    }
    
    func configuerInterface() {
        view.addSubview(registrationView)
        registrationView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 300, height: 400))
            make.center.equalToSuperview()
        }
        registrationView.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalTo(registrationView).inset(16)
        }
        registrationView.addSubview(usernameField)
        usernameField.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        registrationView.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(usernameField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        registrationView.addSubview(repeatPasswordField)
        repeatPasswordField.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        registrationView.addSubview(registrationButton)
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordField.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(40)
        }
    }
    
    @objc  func registrationAction() {
        if passwordField.text == repeatPasswordField.text {
            navigationController?.popViewController(animated: true)
        }
    }
}
