//
//  RegistrationViewController.swift
//  LFP-project
//
//  Created by MacBook on 14.12.21.
//

import UIKit

protocol ChangeRegistrationLabel: AnyObject {
    func didRegistration()
}

class RegistrationViewController: UIViewController {
    
    weak var delegate: ChangeRegistrationLabel?
    
    let registrationLabel: UILabel = {
        let registrationLabel = UILabel()
        registrationLabel.text = "Регистрация"
        registrationLabel.numberOfLines = 0
        registrationLabel.lineBreakMode = .byWordWrapping
        registrationLabel.numberOfLines = 0
        registrationLabel.textAlignment = .center
        registrationLabel.textColor = .black
        registrationLabel.font = registrationLabel.font.withSize(28)
        return registrationLabel
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
        return registrationButton
    }()
    
    func registrationPasswordAlert() {
        let alert = Alert.regisrationPasswordError.controller
        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        present(alert, animated: true, completion: nil)
    }
    func registrationAccountAlert() {
        let alert = Alert.regisrationAccountError.controller
        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuerInterface()
        registrationButton.addTarget(self, action: #selector(registrationAction), for: .touchUpInside)
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
            guard let username = usernameField.text else { return }
            guard let password = passwordField.text else { return }
            let parameters = [
                "username": "\(username)",
                "password": "\(password)"
            ]
            guard let url = URL(string: "https://lfp.monster/api/account/register/") else { return }
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-type")
            request.httpMethod = "POST"
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
            request.httpBody = httpBody
            
            let session = URLSession.shared
            session.dataTask(with: request) { data, response, error in
                guard let data = data  else { return }
                guard let httpResponse = response as? HTTPURLResponse else {
                    return print("Error")
                }
                guard httpResponse.statusCode == 201  else {
                    DispatchQueue.main.async {
                        self.registrationAccountAlert()
                    }
                    return print("Error: \(httpResponse.statusCode)")
                }
                let result = try? JSONSerialization.jsonObject(with: data, options: [])
                guard let result = result else { return }
                print(result)
                DispatchQueue.main.async {
                    self.delegate?.didRegistration()
                    self.navigationController?.popViewController(animated: true)
                }
            }.resume()
        } else {
            registrationPasswordAlert()
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

