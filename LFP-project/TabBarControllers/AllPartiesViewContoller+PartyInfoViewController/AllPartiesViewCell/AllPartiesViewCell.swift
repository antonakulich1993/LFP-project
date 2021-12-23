//
//  AllPartiesViewCell.swift
//  LFP-project
//
//  Created by MacBook on 21.12.21.
//

import UIKit

class AllPartiesViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var playersLabel: UILabel!
    @IBOutlet weak var nextPageImage: UIImageView!
    
    static let identifier = "AllPartiesViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .default
    }

    func setupCell(parties: AllPartiesModel) {
        locationLabel.text = "Адрес: \(parties.location), Игра: \(parties.game)"
        dateLabel.text = "Дата: \(parties.date)"
        startTimeLabel.text = "Начало в \(parties.time)"
        playersLabel.text = "Количество игроков MAX: \(parties.maxPlayers)/ MIN: \(parties.minPlayers)"
        nextPageImage.image = UIImage(named: "next")
        
    }
}
