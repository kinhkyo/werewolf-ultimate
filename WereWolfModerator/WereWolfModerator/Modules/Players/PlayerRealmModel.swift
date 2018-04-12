//
//  PlayerRealmModel.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/11/18.
//  Copyright © 2018 MacPro1. All rights reserved.
//

import Foundation
import RealmSwift
class PlayerModel: Object {
    @objc dynamic var name = ""
    @objc dynamic var value: Data? = nil
}
