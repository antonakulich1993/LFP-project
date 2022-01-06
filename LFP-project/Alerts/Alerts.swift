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
    case regisrationError
    case addPartyError
    case postPartyError
    
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
        case .regisrationError:
            return "Ошибка регистрации"
        case .addPartyError:
            return "Ошибка создания игры"
        case .postPartyError:
            return "Ошибка создания игры"
        }
    }
    
    private   var message: String? {
        switch self {
        case .loginError:
            return "Вы ввели неправильный аккаунт или пароль"
        case .regisrationError:
            return "Проверьте совпадение паролей"
        case .addPartyError:
            return "Проверьте заполнение всех полей"
        case .postPartyError:
            return "Проверьте формат даты и времени"
        }
    }
}
