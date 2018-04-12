//
//  PlayerTableViewCell.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/12/18.
//  Copyright © 2018 MacPro1. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var bg_img: UIImageView!
    @IBOutlet weak var container_view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupUI() {
        container_view.layer.shadowOpacity = 0.25
        container_view.layer.shadowOffset = CGSize(width: 0, height: 4)
        container_view.layer.shadowRadius = 8
       container_view.layer.shadowColor = UIColor.Card.playerCard.cgColor
        
        bg_img.layer.cornerRadius = 6
        bg_img.clipsToBounds = true
    }
    
}
