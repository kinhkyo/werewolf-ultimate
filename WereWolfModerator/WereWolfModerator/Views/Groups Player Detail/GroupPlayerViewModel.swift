//
//  GroupPlayerViewModel.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/12/18.
//  Copyright © 2018 MacPro1. All rights reserved.
//

import Foundation
import UIKit
class GroupPlayerDetailViewModal {
    private var groupPlayer: GroupPlayerModal?
    init(groupPlayer: GroupPlayerModal) {
        self.groupPlayer = groupPlayer
    }
    
    func setupCollectionView(tableView: UITableView){
        tableView.register(UINib(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayerTableViewCell")
    }
    
    func getNumberOfItemPlayerInGroup() -> Int {
        return (groupPlayer?.players.count) ?? 0
    }
}
