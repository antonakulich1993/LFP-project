//
//  RegistrationViewController.swift
//  LFP-project
//
//  Created by MacBook on 14.12.21.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    let registrationLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.text = "Регистрация"
        infoLabel.numberOfLines = 0
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        infoLabel.textColor = .black
        infoLabel.font = infoLabel.font.withSize(28)
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
    
    let infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.text = "*все поля обязательны для заполнения"
        infoLabel.textColor = .systemGray
        infoLabel.textAlignment = .center
        return infoLabel
    }()
    
    let registrationButton: DarkBlueButton = {
        let registrationButton = DarkBlueButton(title: "Зарегистрироваться")
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
        view.addSubview(registrationLabel)
        registrationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(147)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(usernameField)
        usernameField.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.top.equalTo(registrationLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.top.equalTo(usernameField.snp.bottom).offset(34)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(repeatPasswordField)
        repeatPasswordField.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.top.equalTo(passwordField.snp.bottom).offset(34)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordField.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(registrationButton)
        registrationButton.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.top.equalTo(infoLabel.snp.bottom).offset(34)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        
     

    }

    @objc  func registrationAction() {
        if passwordField.text == repeatPasswordField.text {
            
            let parameters = [
                "username": "\(usernameField.text)",
                "password": "\(passwordField.text)"
            ]
            
            guard let url = URL(string: "https://lfp.monster/api/account/register") else { return }
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-type")
            request.httpMethod = "POST"
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
            request.httpBody = httpBody
            
            let session = URLSession.shared
            session.dataTask(with: request) { data, response, error in
                if let response = response {
                    print(response)
                }
                if let data = data {
                    do {
                        let json =  try JSONSerialization.data(withJSONObject: data, options: [])
                        print(json)
                    } catch {
                        
                    }
                }
            }.resume()
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

