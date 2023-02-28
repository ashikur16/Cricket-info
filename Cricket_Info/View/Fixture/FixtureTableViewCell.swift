//
//  FixtureTableViewCell.swift
//  Cricket_Info
//
//  Created by bjit on 22/2/23.
//

import UIKit

class FixtureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var venue: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var team1Flag: UIImageView!
    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team2Flag: UIImageView!
    @IBOutlet weak var team2Name: UILabel!
    @IBOutlet weak var round: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 20
//        bgView.layer.borderWidth = 1
//        bgView.layer.borderColor = UIColor.black.cgColor
        bgView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
