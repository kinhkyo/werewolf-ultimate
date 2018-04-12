//
//  PlayersViewModel.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/11/18.
//  Copyright © 2018 MacPro1. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
class PlayersViewModel: NSObject {
    private var groupPlayer = Variable(Array<GroupPlayerModal>())
    var updatedContent: Observable<Void> {
        return groupPlayer
            .asObservable()
            .distinctUntilChanged{ $0 == $1 }
            .map{ $0.count > 0 }
    }
        
    override init() {
         super.init()
         self.setupData()
    }
    
    private func setupData(){
        groupPlayer.value = getAllGroupPlayer()
    }
    private func getAllGroupPlayer() -> [GroupPlayerModal] {
        return GroupPlayerServices.getAllGroupPlayer()
    }
    private func addNewGroup(name: String) {
        let newGroup = GroupPlayerModal()
        newGroup.groupName = name
        
        GroupPlayerServices.createGroupPlayer(groupPlayer: newGroup)
        // Add to List group
        groupPlayer.value.append(newGroup)
    }
    
    
    func getNumberOfGroup() -> Int {
        return groupPlayer.value.count
    }
    
    func getGroupItemBy(index: Int) -> GroupPlayerModal {
        return groupPlayer.value[index]
    }
    
    func createNewGroup(groupName name: String){
        let newGroup = GroupPlayerModal()
        newGroup.groupName = name
        GroupPlayerServices.createGroupPlayer(groupPlayer: newGroup)
    }
    
    func setupCollectionView(collectionView: UICollectionView){
        collectionView.register((UINib(nibName: "GroupPlayerCollectionViewCell", bundle: nil)), forCellWithReuseIdentifier:"GroupPlayerID")
    }
    
    func createGroupName(view: UIViewController) {
        let alert = UIAlertController(title: "Create Group Player", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter group name"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            if let name = alert.textFields?.first?.text {
                self.addNewGroup(name: name)
            }
        }))
        view.present(alert, animated: true)
    }
}









