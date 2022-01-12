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
    
    let scrollViewContainer: UIStackView = {
        let scrollViewContainer = UIStackView()
        scrollViewContainer.spacing = 20
        scrollViewContainer.axis = .vertical
        scrollViewContainer.distribution = .fillProportionally
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
    }
    
    func configureInterface() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
        
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
        }
        scrollViewContainer.addArrangedSubview(idLabel)
        scrollViewContainer.addArrangedSubview(createdAtLabel)
        scrollViewContainer.addArrangedSubview(updatedAtLabel)
        scrollViewContainer.addArrangedSubview(partyMakerLabel)
        scrollViewContainer.addArrangedSubview(locationLabel)
        scrollViewContainer.addArrangedSubview(gameLabel)
        scrollViewContainer.addArrangedSubview(dateLabel)
        scrollViewContainer.addArrangedSubview(timeLabel)
        scrollViewContainer.addArrangedSubview(durationLabel)
        scrollViewContainer.addArrangedSubview(priceLabel)
        scrollViewContainer.addArrangedSubview(currencyLabel)
        scrollViewContainer.addArrangedSubview(minPlayersLabel)
        scrollViewContainer.addArrangedSubview(maxPlayersLabel)
        
        idLabel.text = "ID игры: \(party.id)"
        createdAtLabel.text = "Игра создана в \(party.createdAt)"
        updatedAtLabel.text = "Игра обновлена \(party.updatedAt)"
        partyMakerLabel.text = "Игру создал: \(party.partymaker)"
        locationLabel.text = "Местоположение: \(party.location)"
        gameLabel.text = "Игра: \(party.game)"
        dateLabel.text = "Дата: \(party.date)"
        timeLabel.text = "Время начала: \(party.time)"
        durationLabel.text = "Время продолжительности игры: \(party.duration)"
        priceLabel.text = "Стоимосоть: \(party.price)"
        currencyLabel.text = "Валюта: \(party.currency)"
        minPlayersLabel.text = "Минимальноe количество игроков: \(party.minPlayers)"
        maxPlayersLabel.text = "Максимальное количество игроков: \(party.maxPlayers)"
    }
}
