//
//  PlayerDetailTableViewCell.swift
//  Cricket_Info
//
//  Created by bjit on 17/2/23.
//

import UIKit

class PlayerDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var battingStyle: UILabel!
    @IBOutlet weak var bowlingStyle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
