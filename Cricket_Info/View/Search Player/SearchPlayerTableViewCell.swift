//
//  SearchPlayerTableViewCell.swift
//  Cricket_Info
//
//  Created by bjit on 19/2/23.
//

import UIKit

class SearchPlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 20
        bgView.clipsToBounds = true
        
        bgView.layer.borderWidth = 0.5
        bgView.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

}
