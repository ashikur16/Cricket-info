//
//  Team1SquadTableViewCell.swift
//  Cricket_Info
//
//  Created by bjit on 13/2/23.
//

import UIKit

class Team1SquadTableViewCell: UITableViewCell {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        playerImage.layer.cornerRadius = min(playerImage.frame.size.width, playerImage.frame.size.height) / 2.0
//        playerImage.layer.borderWidth = 1.0
//        playerImage.layer.borderColor = UIColor.systemGreen.cgColor
//        playerImage.clipsToBounds = true
//
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
