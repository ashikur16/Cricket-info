//
//  TeamRankingTableViewCell.swift
//  Cricket_Info
//
//  Created by bjit on 20/2/23.
//

import UIKit

class TeamRankingTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamFlag: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.layer.cornerRadius = 20
        bgView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
