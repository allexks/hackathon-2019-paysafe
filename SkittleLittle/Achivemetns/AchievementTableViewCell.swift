//
//  AchievementTableViewCell.swift
//  SkittleLittle
//
//  Created by Aleksandar Ignatov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import UIKit

class AchievementTableViewCell: UITableViewCell {

    @IBOutlet weak var badgeImageView: UIImageView!
    @IBOutlet weak var shareImageView: UIImageView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var conditionsLabel: UILabel!
    
    func lock() {
        nameLabel.textColor = .gray
        levelLabel.isHidden = true
        shareImageView.image = UIImage(named: "lock")
    }
    
    func unlock() {
        nameLabel.textColor = .black
        levelLabel.isHidden = false
        shareImageView.image = UIImage(named: "share")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
