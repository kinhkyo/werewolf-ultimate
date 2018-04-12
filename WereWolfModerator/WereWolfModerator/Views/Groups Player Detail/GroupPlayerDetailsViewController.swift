//
//  GroupPlayerDetailsViewController.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/12/18.
//  Copyright © 2018 MacPro1. All rights reserved.
//

import UIKit

class GroupPlayerDetailsViewController: UIViewController {
    var group: GroupPlayerModal?
    lazy var groupPlayerViewModal: GroupPlayerDetailViewModal = {
        return GroupPlayerDetailViewModal(groupPlayer: self.group!)
    }()
    @IBOutlet weak var group_player_tb: UITableView!
    @IBOutlet weak var group_name_lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupUI() {
        if let groupPlayer = group {
            group_name_lbl.text = groupPlayer.groupName
        }
        
        group_player_tb.delegate = self
        group_player_tb.dataSource = self
        groupPlayerViewModal.setupCollectionView(tableView: group_player_tb)
    }



}

extension GroupPlayerDetailsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return groupPlayerViewModal.getNumberOfItemPlayerInGroup()
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
}
