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
    
    static let identifier = "AllPartiesViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
