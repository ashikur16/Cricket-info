//
//  ScoreboardTableViewCell.swift
//  Cricket_Info
//
//  Created by bjit on 16/2/23.
//

import UIKit

class ScoreboardTableViewCell: UITableViewCell {

    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var runs: UILabel!
    @IBOutlet weak var balls: UILabel!
    @IBOutlet weak var fours: UILabel!
    @IBOutlet weak var sixs: UILabel!
    @IBOutlet weak var strikeRate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
