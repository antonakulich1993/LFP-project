//
//  Alerts.swift
//  LFP-project
//
//  Created by MacBook on 6.01.22.
//

import Foundation
import UIKit

enum Alert {
    case loginError
    case regisrationPasswordError
    case addPartyError
    case postPartyError
    case regisrationAccountError
    case fullParty
    
    
    var controller: UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    var sheet: UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    }
    
    private var title: String? {
        switch self {
        case .loginError:
            return "Ошибка входа!"
        case .regisrationPasswordError:
            return "Ошибка регистрации"
        case .addPartyError:
            return "Ошибка создания игры"
        case .postPartyError:
            return "Ошибка создания игры"
        case .regisrationAccountError:
            return "Ошика регистрации"
        case .fullParty:
            return "Группа уже сформирована"
        }
    }
    
    private   var message: String? {
        switch self {
        case .loginError:
            return "Вы ввели неправильный аккаунт или пароль"
        case .regisrationPasswordError:
            return "Пароли не совпадают"
        case .addPartyError:
            return "Проверьте заполнение всех полей"
        case .postPartyError:
            return "Проверьте правильность заполнения полей"
        case .regisrationAccountError:
            return "Такое имя пользователя уже существует"
        case .fullParty:
            return "Извините, нет свободных мест"
        }
    }
}
