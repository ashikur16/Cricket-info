//
//  InfoTableViewCell.swift
//  Cricket_Info
//
//  Created by bjit on 18/2/23.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.cornerRadius = 50
        bgView.clipsToBounds = true
        
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
