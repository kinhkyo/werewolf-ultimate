//
//  PlayerServices.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/11/18.
//  Copyright © 2018 MacPro1. All rights reserved.
//

import Foundation
import RealmSwift

struct PlayerServices {
    static func createUser(player: PlayerModel){
        let realm = try! Realm()
        try! realm.write {
            realm.add(player)
        }
    }
    static func getAllPlayer() -> [PlayerModel] {
        let realm = try! Realm()
        let players = realm.objects(PlayerModel.self) // retrieves all Dogs from the default Realm
        return Array(players)
    }
}
