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
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        loginButton.showsTouchWhenHighlighted = true
        return loginButton
    }()
    
    let questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.text = "Впервые у нас?"
        questionLabel.textColor = .black
        return questionLabel
    }()
    
    let registrationButton: UIButton = {
        let registrationButton = UIButton()
        registrationButton.backgroundColor = UIColor(red: 0.58, green: 0.59, blue: 0.69, alpha: 1.0)
        registrationButton.setTitle("Зарегистрироваться", for: .normal)
        registrationButton.addTarget(self, action: #selector(registrationAction), for: .touchUpInside)
        registrationButton.layer.cornerRadius = 8
        registrationButton.showsTouchWhenHighlighted = true
        return registrationButton
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureIntreface()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    func configureIntreface() {
        view.backgroundColor = .white
        
        view.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 230, height: 160))
            make.top.equalToSuperview().offset(80)
            make.leading.trailing.equalToSuperview().inset(80)
        }
        
        view.addSubview(enterLabel)
        enterLabel.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 63, height: 33))
            make.top.equalTo(logoImage.snp.bottom).offset(44)
            make.leading.equalToSuperview().inset(164)
        }
        
        view.addSubview(usernameField)
        usernameField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 358, height: 54))
            make.top.equalTo(enterLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 358, height: 54))
            make.top.equalTo(usernameField.snp.bottom).offset(34)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 358, height: 54))
            make.top.equalTo(passwordField.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview().inset(16)

        }
        
        view.addSubview(questionLabel)
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(36)
            make.leading.equalToSuperview().inset(130)
        }
        
        view.addSubview(registrationButton)
        registrationButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 358, height: 54))
            make.top.equalTo(questionLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    
    @objc func loginAction() {
        
    }
    
    @objc func registrationAction() {
        let registrationViewController = RegistrationViewController()
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
