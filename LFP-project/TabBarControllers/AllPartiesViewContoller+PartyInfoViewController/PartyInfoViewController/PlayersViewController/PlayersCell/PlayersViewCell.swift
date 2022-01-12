//
//  PlayersViewCell.swift
//  LFP-project
//
//  Created by MacBook on 23.12.21.
//

import UIKit

class PlayersViewCell: UITableViewCell {
    
    @IBOutlet weak var playerLabel: UILabel!
    
    static let identifier = "PlayersViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .white
    }
}
