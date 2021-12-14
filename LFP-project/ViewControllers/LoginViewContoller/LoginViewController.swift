//
//  LoginViewController.swift
//  LFP-project
//
//  Created by MacBook on 13.12.21.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    let authorizationView: UIView = {
        let authorizationView = UIView()
        authorizationView.backgroundColor = .systemGray6
        authorizationView.layer.shadowOffset = CGSize(width: 1,
                                                    height: 1)
        authorizationView.layer.shadowRadius = 5
        authorizationView.layer.shadowOpacity = 0.3
        return authorizationView
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
        return passwordField
    }()
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Войти", for: .normal)
        loginButton.backgroundColor = .systemGreen
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        loginButton.layer.cornerRadius = 10
        return loginButton
    }()
    let registrationButton: UIButton = {
        let registrationButton = UIButton()
        registrationButton.backgroundColor = .systemGreen
        registrationButton.setTitle("Зарегистрироваться", for: .normal)
        registrationButton.addTarget(self, action: #selector(registrationAction), for: .touchUpInside)
        registrationButton.layer.cornerRadius = 10
        return registrationButton
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureIntreface()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Авторизация"
        view.backgroundColor = .white
        
    }
    
    func configureIntreface() {
        view.addSubview(authorizationView)
        authorizationView.snp.makeConstraints { make in
            make.size.equalTo(300)
            make.center.equalToSuperview()
        }
        authorizationView.addSubview(usernameField)
        usernameField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalTo(authorizationView).inset(16)
        }
        authorizationView.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(usernameField.snp.bottom).offset(20)
            make.leading.trailing.equalTo(authorizationView).inset(16)
        }
        authorizationView.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(20)
            make.leading.trailing.equalTo(authorizationView).inset(40)
            
        }
        authorizationView.addSubview(registrationButton)
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(40)
        }
    }
    
    @objc func loginAction() {
        passwordField.text = "hui"
        
    }
    
    @objc func registrationAction() {
        usernameField.text = "penis"
        
    }
}
