//
//  GroupPlayerCollectionViewCell.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/11/18.
//  Copyright © 2018 MacPro1. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class GroupPlayerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var base_view: UIView!
    @IBOutlet weak var container_view: UIView!
    @IBOutlet weak var avatar_img: UIImageView!
    
    @IBOutlet weak var total_players_lbl: UILabel!
    @IBOutlet weak var group_name_lbl: UILabel!
    var disposeBag = DisposeBag()
    var group = Variable(GroupPlayerModal())
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initUI()
        initRx()
    }
    
    func initUI(){
        base_view.layer.shadowOpacity = 0.25
        base_view.layer.shadowOffset = CGSize(width: 0, height: 2)
        base_view.layer.shadowRadius = 5
        
        container_view.layer.cornerRadius = 14
        container_view.clipsToBounds = true

    }
    
    func initRx() {
        group.asDriver().drive(onNext: { group in
            self.group_name_lbl.text = group.groupName
            self.total_players_lbl.text = "\(group.players.count) players"
        }).disposed(by: disposeBag)
    }

}
