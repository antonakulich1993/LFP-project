//
//  GameInfoViewController.swift
//  LFP-project
//
//  Created by MacBook on 23.12.21.
//

import UIKit
import SnapKit

class GameInfoViewController: UIViewController {
    
    private let party: AllPartiesModel
    
    init(party: AllPartiesModel) {
        self.party = party
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    let scrollViewContainer: UIView = {
        let scrollViewContainer = UIView()
        scrollViewContainer.backgroundColor = .white
        return scrollViewContainer
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.text = "ID"
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let createdAtLabel: UILabel = {
        let label = UILabel()
        label.text = "createdAt"
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let updatedAtLabel: UILabel = {
        let label = UILabel()
        label.text = "updatedAt"
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let partyMakerLabel: UILabel = {
        let label = UILabel()
        label.text = "partymaker"
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "location"
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let gameLabel: UILabel = {
        let label = UILabel()
        label.text = "game"
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "date"
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "time"
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "duration"
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "price"
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let currencyLabel: UILabel = {
        let label = UILabel()
        label.text = "currency"
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let minPlayersLabel: UILabel = {
        let label = UILabel()
        label.text = "minPlayers"
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let maxPlayersLabel: UILabel = {
        let label = UILabel()
        label.text = "maxPlayers"
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let changeButton: DarkBlueButton = {
        let button = DarkBlueButton(title: "Изменить")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
        changeButton.isHidden = true
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
        
        scrollViewContainer.addSubview(idLabel)
        idLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        
        scrollViewContainer.addSubview(createdAtLabel)
        createdAtLabel.snp.makeConstraints { make in
            make.top.equalTo(idLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        
        scrollViewContainer.addSubview(updatedAtLabel)
        updatedAtLabel.snp.makeConstraints { make in
            make.top.equalTo(createdAtLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        scrollViewContainer.addSubview(partyMakerLabel)
        partyMakerLabel.snp.makeConstraints { make in
            make.top.equalTo(updatedAtLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        scrollViewContainer.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(partyMakerLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        scrollViewContainer.addSubview(gameLabel)
        gameLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        scrollViewContainer.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(gameLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        scrollViewContainer.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        scrollViewContainer.addSubview(durationLabel)
        durationLabel.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        scrollViewContainer.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(durationLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        scrollViewContainer.addSubview(currencyLabel)
        currencyLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        scrollViewContainer.addSubview(minPlayersLabel)
        minPlayersLabel.snp.makeConstraints { make in
            make.top.equalTo(currencyLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        scrollViewContainer.addSubview(maxPlayersLabel)
        maxPlayersLabel.snp.makeConstraints { make in
            make.top.equalTo(minPlayersLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        scrollViewContainer.addSubview(changeButton)
        changeButton.snp.makeConstraints { make in
            make.top.equalTo(maxPlayersLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(54)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        idLabel.text = "ID игры: \(party.id)"
        createdAtLabel.text = "Игра создана в \(party.createdAt)"
        updatedAtLabel.text = "Игра обновлена \(party.updatedAt)"
        partyMakerLabel.text = "Игру создал: \(party.partymaker)"
        locationLabel.text = "Местоположение: \(party.location)"
        gameLabel.text = "Игра: \(party.game)"
        dateLabel.text = "Дата: \(party.date)"
        timeLabel.text = "Время начала: \(party.time)"
        durationLabel.text = "Время продолжительности игры: \(party.duration)"
        priceLabel.text = "Стоимость: \(party.price)"
        currencyLabel.text = "Валюта: \(party.currency)"
        minPlayersLabel.text = "Минимальноe количество игроков: \(party.minPlayers)"
        maxPlayersLabel.text = "Максимальное количество игроков: \(party.maxPlayers)"
    }
}
