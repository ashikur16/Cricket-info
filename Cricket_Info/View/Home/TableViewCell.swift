//
//  TableViewCell.swift
//  Cricket_Info
//
//  Created by bjit on 9/2/23.
//

import UIKit

class TableViewCell: UITableViewCell {
   
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var round: UILabel!
    
    @IBOutlet weak var team1Flag: UIImageView!
    @IBOutlet weak var team2Flag: UIImageView!
    
    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team2Name: UILabel!
    
    @IBOutlet weak var team1Score: UILabel!
    @IBOutlet weak var team1Over: UILabel!
    
    @IBOutlet weak var team2Score: UILabel!
    @IBOutlet weak var team2Over: UILabel!
    
    @IBOutlet weak var matchResult: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.cornerRadius = 20
        bgView.clipsToBounds = true
        
//        bgView.layer.borderWidth = 1.0
//        bgView.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
