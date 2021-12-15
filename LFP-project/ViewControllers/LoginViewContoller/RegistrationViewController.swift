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
        infoLabel.text = "Все поля обязательны к заполнению"
        infoLabel.numberOfLines = 0
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        infoLabel.textColor = .black
        infoLabel.font = infoLabel.font.withSize(20)
        return infoLabel
    }()
    
    let usernameField: CustomTextField = {
        let usernameField = CustomTextField()
        usernameField.attributedPlaceholder = NSAttributedString(string: "Имя пользователя",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return usernameField
    }()
    
    let passwordField: CustomTextField = {
        let passwordField = CustomTextField()
        passwordField.attributedPlaceholder = NSAttributedString(string: "Пароль",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordField.isSecureTextEntry = true
        return passwordField
    }()
    
    let repeatPasswordField: CustomTextField = {
        let repeatPasswordField = CustomTextField()
       
        repeatPasswordField.attributedPlaceholder = NSAttributedString(string: "Подтвердите пароль",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        repeatPasswordField.isSecureTextEntry = true
        return repeatPasswordField
    }()
    
    let registrationButton: DarkBlueButton = {
        let registrationButton = DarkBlueButton(title: "Зарегестрироваться")
        registrationButton.addTarget(self, action: #selector(registrationAction), for: .touchUpInside)
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
        view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(usernameField)
        usernameField.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(usernameField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(repeatPasswordField)
        repeatPasswordField.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(registrationButton)
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
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

