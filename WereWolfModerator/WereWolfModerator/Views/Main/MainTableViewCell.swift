//
//  MainTableViewCell.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/10/18.
//  Copyright © 2018 MacPro1. All rights reserved.
//

import UIKit
import Localize_Swift
import RxSwift
import RxCocoa

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var background_img: UIImageView!
    @IBOutlet weak var card_container_view: UIView!
    @IBOutlet weak var title_lb: UILabel!
    @IBOutlet weak var desc_lb: UILabel!
    @IBOutlet weak var action_btn: UIButton!
    var card = Variable(HomeCardModel())
    let disposeBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        setupRx()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

private extension MainTableViewCell {
    func setupUI(){
        background_img.backgroundColor = UIColor.Card.rgbPalette.first
        background_img.layer.cornerRadius = 14
        background_img.clipsToBounds = true
        
        card_container_view.layer.shadowOpacity = 0.25
        card_container_view.layer.shadowOffset = CGSize(width: 0, height: 10)
        card_container_view.layer.shadowRadius = 14
    }
    
    func setupRx(){
        card.asObservable().do(onNext: { card in
            self.title_lb.text = card.title
            self.desc_lb.text = card.description
            self.action_btn.setTitle(card.actionName, for: .normal)
            if let img = card.img {
                self.background_img.image = UIImage(named: img)
            }
        }).subscribe().disposed(by: disposeBag)
    }
    
}
