//
//  LiveMatchCollectionViewCell.swift
//  Cricket_Info
//
//  Created by bjit on 10/2/23.
//

import UIKit

class LiveMatchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var venue: UILabel!
    
    @IBOutlet weak var team1Flag: UIImageView!
    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team1Score: UILabel!
    @IBOutlet weak var team1Over: UILabel!
    
    @IBOutlet weak var team2Flag: UIImageView!
    @IBOutlet weak var team2Name: UILabel!
    @IBOutlet weak var team2Score: UILabel!
    @IBOutlet weak var team2Over: UILabel!
    
    @IBOutlet weak var matchResult: UILabel!
    @IBOutlet weak var LiveView: UIView!
    
    @IBOutlet weak var matchStatus: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        LiveView.layer.cornerRadius = 20
        LiveView.clipsToBounds = true
    }
}
