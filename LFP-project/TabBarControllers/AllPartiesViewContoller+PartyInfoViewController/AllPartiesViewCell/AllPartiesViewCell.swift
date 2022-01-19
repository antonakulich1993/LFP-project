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
    
    override func layoutSubviews() {
           super.layoutSubviews()
           let margins = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
           contentView.frame = contentView.frame.inset(by: margins)
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 1.0, alpha: 1.0)
        contentView.layer.cornerRadius = 15
        selectionStyle = .default
        contentView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        contentView.layer.shadowOffset = CGSize(width: 5.0, height: 10.0)
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowRadius = 5
        contentView.layer.masksToBounds = false
    }

    func setupCell(parties: AllPartiesModel) {
        locationLabel.text = "Адрес: \(parties.location), Игра: \(parties.game)"
        dateLabel.text = "\(parties.date)"
        startTimeLabel.text = "\(parties.time)"
        playersLabel.text = "MAX: \(parties.maxPlayers)"
        nextPageImage.image = UIImage(named: "next")
    }
}
