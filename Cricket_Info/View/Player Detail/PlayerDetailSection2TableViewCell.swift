//
//  PlayerDetailSection2TableViewCell.swift
//  Cricket_Info
//
//  Created by bjit on 21/2/23.
//

import UIKit

class PlayerDetailSection2TableViewCell: UITableViewCell {
    @IBOutlet weak var battingMatch: UILabel!
    @IBOutlet weak var battingRun: UILabel!
    @IBOutlet weak var battingHighestRun: UILabel!
    @IBOutlet weak var battingStrikeRate: UILabel!
    @IBOutlet weak var battingAverage: UILabel!
    @IBOutlet weak var battingHundred: UILabel!
    @IBOutlet weak var battingFifty: UILabel!
    
    @IBOutlet weak var stateType: UILabel!
    
    @IBOutlet weak var bowlingMatch: UILabel!
    @IBOutlet weak var bowlingOver: UILabel!
    @IBOutlet weak var bowlingRun: UILabel!
    @IBOutlet weak var bowlingWicket: UILabel!
    @IBOutlet weak var bowlingAverage: UILabel!

    @IBOutlet weak var bowlingRate: UILabel!
    
    @IBOutlet weak var bowlingNoBall: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
