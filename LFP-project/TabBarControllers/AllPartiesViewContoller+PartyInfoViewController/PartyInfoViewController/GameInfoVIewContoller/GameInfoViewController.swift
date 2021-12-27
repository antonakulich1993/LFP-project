//
//  GameInfoViewController.swift
//  LFP-project
//
//  Created by MacBook on 23.12.21.
//

import UIKit
import SnapKit

class GameInfoViewController: UIViewController {
    
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
    
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
        getGameInfo()
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
    }
    
    func getGameInfo() {
        guard let token = DefaultsManager.token else { return }
        
        guard let url = URL(string: "https://lfp.monster/api/party/\(id)/") else { return }
        
        var request = URLRequest(url: url)
        request.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
    
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                return print("Error")
            }
            guard httpResponse.statusCode == 200 else { return
                print("Error: \(httpResponse.statusCode)")
            }
            guard let data = data else {
                return
            }
            
            let result = try? JSONDecoder().decode([AllPartiesModel].self, from: data)
            guard let result = result else { return }
            var _ = result
        }.resume()
    }
}
//{\"id\":4,\"created_at\":\"2021-11-26\",\"updated_at\":\"2021-11-26\",\"location\":\"Жудро\",\"game\":\"Football\",\"date\":\"2021-12-30\",\"time\":\"11:00:00\",\"duration\":60,\"price\":\"10.00\",\"currency\":\"BYN\",\"is_price_total\":true,\"min_players\":10,\"max_players\":15,\"partymaker\":1,\"joined_usernames\":[\"Gaagle93\",\"kopytok\",\"test1\",\"Vlad\",\"Anya\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"joined_cnt\":5}"
