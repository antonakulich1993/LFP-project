//
//  LoginViewController.swift
//  LFP-project
//
//  Created by MacBook on 13.12.21.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    let logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "lfpLogo")
        logoImage.contentMode = .scaleAspectFit
        return logoImage
    }()
    
    let enterLabel: UILabel = {
        let enterLabel = UILabel()
        enterLabel.text = "Вход"
        enterLabel.textColor = .black
        enterLabel.font = enterLabel.font.withSize(28)
        enterLabel.lineBreakMode = .byWordWrapping
        return enterLabel
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
        passwordField.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 1.0, alpha: 1.0)
        passwordField.isSecureTextEntry = true
        return passwordField
    }()
    
    let loginButton: DarkBlueButton = {
        let loginButton = DarkBlueButton(title: "Войти")
        return loginButton
    }()
    
    let questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.text = "Впервые у нас?"
        questionLabel.textColor = .systemGray
        return questionLabel
    }()
    
    let registrationButton: UIButton = {
        let registrationButton = UIButton()
        registrationButton.backgroundColor = UIColor(red: 0.58, green: 0.59, blue: 0.69, alpha: 1.0)
        registrationButton.setTitle("Зарегистрироваться", for: .normal)
        registrationButton.layer.cornerRadius = 8
        return registrationButton
    }()
    
    func loginAlert() {
        let alert = Alert.loginError.controller
        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureIntreface()
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(registrationAction), for: .touchUpInside)
        hideKeyboardWhenTappedAround()
    }
    
    func configureIntreface() {
        view.backgroundColor = .white
        
        view.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.height.equalTo(160)
            make.top.equalToSuperview().offset(80)
            make.leading.trailing.equalToSuperview().inset(80)
        }
        
        view.addSubview(enterLabel)
        enterLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(44)
            make.centerX.equalTo(logoImage.snp.centerX)
        }
        
        view.addSubview(usernameField)
        usernameField.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.top.equalTo(enterLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.top.equalTo(usernameField.snp.bottom).offset(34)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(54)
            
        }
        
        view.addSubview(questionLabel)
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(36)
            make.leading.equalToSuperview().inset(130)
        }
        
        view.addSubview(registrationButton)
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }
    }
    
    @objc func loginAction() {
        guard let username = usernameField.text else { return }
        guard let password = passwordField.text else { return }
        
        let parameters = [
            "username": "\(username)",
            "password": "\(password)"
        ]
        guard let url = URL(string: "https://lfp.monster/api/account/token-auth/") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.httpMethod = "POST"
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            guard httpResponse.statusCode == 200 else {
                DispatchQueue.main.async {
                    self.loginAlert()
                }
                return print("Error: \(httpResponse.statusCode)")
            }
            
            let result = try? JSONDecoder().decode(Token.self, from: data)
            guard let token = result?.token else { return }
            guard let id = result?.id else { return }
            DefaultsManager.id = id
            DefaultsManager.token = token
            DefaultsManager.username = username
            
            DispatchQueue.main.async {
                let appDelegate = UIApplication.shared.delegate as? AppDelegate
                let appDelegateWindow = appDelegate?.window
                appDelegateWindow?.rootViewController?.dismiss(animated: false)
                appDelegateWindow?.rootViewController = TabBarControllers()
            }
        }.resume()
    }
    
    @objc func registrationAction() {
        let registrationViewController = RegistrationViewController()
        registrationViewController.delegate = self
        navigationController?.pushViewController(registrationViewController, animated: true)
    }
}

extension LoginViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension LoginViewController: ChangeRegistrationLabel {
    func didRegistration() {
        enterLabel.text = "Вы уcпешно зарегистрировались!"
        enterLabel.textColor = .systemGreen
        enterLabel.font = enterLabel.font.withSize(20)
    }
}
