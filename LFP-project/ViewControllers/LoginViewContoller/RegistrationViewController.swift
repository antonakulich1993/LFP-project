//
//  RegistrationViewController.swift
//  LFP-project
//
//  Created by MacBook on 14.12.21.
//

import UIKit

class RegistrationViewController: UIViewController {
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
        usernameField.attributedPlaceholder = NSAttributedString(string: "Имя пользователя",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        usernameField.textColor = .black
        usernameField.tintColor = .black
        usernameField.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 1.0, alpha: 1.0)
        return usernameField
    }()
    
    let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.borderStyle = .roundedRect
        passwordField.attributedPlaceholder = NSAttributedString(string: "Имя пользователя",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordField.textColor = .black
        passwordField.tintColor = .black
        passwordField.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 1.0, alpha: 1.0)
        return passwordField
    }()
    
    let repeatPasswordField: UITextField = {
        let repeatPasswordField = UITextField()
        repeatPasswordField.borderStyle = .roundedRect
        repeatPasswordField.attributedPlaceholder = NSAttributedString(string: "Имя пользователя",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        repeatPasswordField.textColor = .black
        repeatPasswordField.tintColor = .black
        repeatPasswordField.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 1.0, alpha: 1.0)
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
        hideKeyboardWhenTappedAround()
        view.backgroundColor = .white
    }
    
    func configuerInterface() {
//        view.addSubview(registrationView)
//        registrationView.snp.makeConstraints { make in
//            make.size.equalTo(CGSize(width: 300, height: 400))
//            make.center.equalToSuperview()
//        }
//        registrationView.addSubview(infoLabel)
//        infoLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(20)
//            make.leading.trailing.equalTo(registrationView).inset(16)
//        }
//        registrationView.addSubview(usernameField)
//        usernameField.snp.makeConstraints { make in
//            make.top.equalTo(infoLabel.snp.bottom).offset(30)
//            make.leading.trailing.equalToSuperview().inset(16)
//        }
//        registrationView.addSubview(passwordField)
//        passwordField.snp.makeConstraints { make in
//            make.top.equalTo(usernameField.snp.bottom).offset(30)
//            make.leading.trailing.equalToSuperview().inset(16)
//        }
//        registrationView.addSubview(repeatPasswordField)
//        repeatPasswordField.snp.makeConstraints { make in
//            make.top.equalTo(passwordField.snp.bottom).offset(30)
//            make.leading.trailing.equalToSuperview().inset(16)
//        }
//        registrationView.addSubview(registrationButton)
//        registrationButton.snp.makeConstraints { make in
//            make.top.equalTo(repeatPasswordField.snp.bottom).offset(40)
//            make.leading.trailing.equalToSuperview().inset(40)
//        }
    }

    @objc  func registrationAction() {
        if passwordField.text == repeatPasswordField.text {
            navigationController?.popViewController(animated: true)
        }
    }
}

extension RegistrationViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(RegistrationViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

