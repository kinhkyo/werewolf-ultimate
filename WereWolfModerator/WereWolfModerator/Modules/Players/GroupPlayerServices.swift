//
//  GroupPlayerServices.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/11/18.
//  Copyright © 2018 MacPro1. All rights reserved.
//

import Foundation
import RealmSwift

struct GroupPlayerServices {
    
    static func createGroupPlayer(groupPlayer: GroupPlayerModal){
         let realm = try! Realm()
        try! realm.write {
            realm.add(groupPlayer)
        }
    }
    static func getGroupPlayerBy(name: String) -> GroupPlayerModal? {
        let realm = try! Realm()
        let group = realm.objects(GroupPlayerModal.self).filter("groupName LIKE %\(name)%")
        return group.first
    }
    
    
    static func addPlayerToGroup(players: [PlayerModel]){
        let realm = try! Realm()
        let players = realm.objects(GroupPlayerModal.self)
        
    }
    static func getAllGroupPlayer() -> [GroupPlayerModal] {
        let realm = try! Realm()
        let players = realm.objects(GroupPlayerModal.self)
    
        return players.reversed()
    }
}
