//
//  ProfileSettingsViewController.swift
//  LFP-project
//
//  Created by MacBook on 19.01.22.
//

import UIKit
import SnapKit

protocol ChangeUserSettingsDelegate: AnyObject {
    func didChange(user: User)
}

class ProfileSettingsViewController: UIViewController {
    
    weak var delegate: ChangeUserSettingsDelegate?
    
    let phoneField: CustomTextField = {
        let field = CustomTextField()
        field.attributedPlaceholder = NSAttributedString(string: "Номер телефона",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return field
    }()
    
    let inputButton: DarkBlueButton = {
        let button = DarkBlueButton(title: "Ввод")
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Пользовательские настройки"
        inputButton.addTarget(self, action: #selector(inputAction), for: .touchUpInside)
      configureInterface()
    }
    
    
   private func configureInterface() {
       view.backgroundColor = .white
       
       view.addSubview(phoneField)
       phoneField.snp.makeConstraints { make in
           make.top.equalToSuperview().offset(100)
           make.centerX.equalTo(view.snp.centerX)
           make.leading.trailing.equalToSuperview().inset(60)
           make.height.equalTo(45)
       }
       
       view.addSubview(inputButton)
       inputButton.snp.makeConstraints { make in
           make.top.equalTo(phoneField.snp.bottom).offset(16)
           make.leading.trailing.equalTo(phoneField)
           make.height.equalTo(45)
       }
    }
    
    @objc func inputAction() {
        let user = User()
        guard let phone = phoneField.text else { return }
        user.phone = phone
        delegate?.didChange(user: user)
        navigationController?.popViewController(animated: true)
    }
}

