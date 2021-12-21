//
//  AddPartyViewController.swift
//  LFP-project
//
//  Created by MacBook on 20.12.21.
//

import UIKit
import SnapKit
import LineTextField

class AddPartyViewController: UIViewController {
    
     let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
     let scrollViewContainer: UIView = {
        let scrollViewContainer = UIView()
        scrollViewContainer.backgroundColor = .red
        return scrollViewContainer
    }()
    
    
    let addPartyLabel: UILabel = {
        let addPartyLabel = UILabel()
        addPartyLabel.text = "Создать игру"
        addPartyLabel.numberOfLines = 0
        addPartyLabel.lineBreakMode = .byWordWrapping
        addPartyLabel.numberOfLines = 0
        addPartyLabel.textAlignment = .center
        addPartyLabel.textColor = .black
        addPartyLabel.font = addPartyLabel.font.withSize(28)
        return addPartyLabel
    }()
    
    let gameField: LineTextField = {
        let gameField = LineTextField()
        gameField.lineColorDefault = UIColor(red: 0.73, green: 0.74, blue: 0.85, alpha: 1.0)
        gameField.lineColorActive = UIColor.black
        gameField.placeholder = "Название игры"
        gameField.floatingPlaceholder = true
        return gameField
    }()
    
    let locationField: LineTextField = {
        let locationField = LineTextField()
        locationField.lineColorDefault = UIColor(red: 0.73, green: 0.74, blue: 0.85, alpha: 1.0)
        locationField.lineColorActive = UIColor.black
        locationField.placeholder = "Локация для игры"
        locationField.floatingPlaceholder = true
        return locationField
    }()
    
    let dateField: LineTextField = {
        let dateField = LineTextField()
        dateField.lineColorDefault = UIColor(red: 0.73, green: 0.74, blue: 0.85, alpha: 1.0)
        dateField.lineColorActive = UIColor.black
        dateField.placeholder = "Дата начала игры"
        dateField.floatingPlaceholder = true
        return dateField
    }()
    
    let timeField: LineTextField = {
        let timeField = LineTextField()
        timeField.lineColorDefault = UIColor(red: 0.73, green: 0.74, blue: 0.85, alpha: 1.0)
        timeField.lineColorActive = UIColor.black
        timeField.placeholder = "Время начала игры"
        timeField.floatingPlaceholder = true
        return timeField
    }()
    
    let gameDurationField: LineTextField = {
        let gameDurationField = LineTextField()
        gameDurationField.lineColorDefault = UIColor(red: 0.73, green: 0.74, blue: 0.85, alpha: 1.0)
        gameDurationField.lineColorActive = UIColor.black
        gameDurationField.placeholder = "Время длительности игры"
        gameDurationField.floatingPlaceholder = true
        return gameDurationField
    }()
    
    let minPlayersField: LineTextField = {
        let minPlayersField = LineTextField()
        minPlayersField.lineColorDefault = UIColor(red: 0.73, green: 0.74, blue: 0.85, alpha: 1.0)
        minPlayersField.lineColorActive = UIColor.black
        minPlayersField.placeholder = "Минимальное количество игроков"
        minPlayersField.floatingPlaceholder = true
        return minPlayersField
    }()
    
    let maxPlayersField: LineTextField = {
        let maxPlayersField = LineTextField()
        maxPlayersField.lineColorDefault = UIColor(red: 0.73, green: 0.74, blue: 0.85, alpha: 1.0)
        maxPlayersField.lineColorActive = UIColor.black
        maxPlayersField.placeholder = "Максимальное колличетсво игроков"
        maxPlayersField.floatingPlaceholder = true
        return maxPlayersField
    }()
    
    let priceField: LineTextField = {
        let priceField = LineTextField()
        priceField.lineColorDefault = UIColor(red: 0.73, green: 0.74, blue: 0.85, alpha: 1.0)
        priceField.lineColorActive = UIColor.black
        priceField.placeholder = "Полная стоимость игры"
        priceField.floatingPlaceholder = true
        return priceField
    }()
    
    let currencyField: LineTextField = {
        let currencyField = LineTextField()
        currencyField.lineColorDefault = UIColor(red: 0.73, green: 0.74, blue: 0.85, alpha: 1.0)
        currencyField.lineColorActive = UIColor.black
        currencyField.placeholder = "Валюта"
        currencyField.floatingPlaceholder = true
        return currencyField
    }()
    
    let infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.text = "*все поля обязательны для заполнения"
        infoLabel.textColor = .systemGray
        infoLabel.textAlignment = .center
        return infoLabel
    }()
    
    let addPartyButton: DarkBlueButton = {
        let addPartyButton = DarkBlueButton(title: "Создать игру")
        return addPartyButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
    }
    
    func configureInterface() {
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.width.equalTo(view)
        }
    }
}

