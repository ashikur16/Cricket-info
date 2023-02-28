//
//  FixturueCollectionViewCell.swift
//  Cricket_Info
//
//  Created by bjit on 22/2/23.
//

import UIKit

class FixturueCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var leagueLogo: UIImageView!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            bgView.layer.cornerRadius = 20
            bgView.clipsToBounds = true
            
            bgView.layer.borderWidth = 1
            bgView.layer.borderColor = UIColor.black.cgColor
        }
    
}
