//
//  HomeCardModel.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/11/18.
//  Copyright © 2018 MacPro1. All rights reserved.
//

import Foundation
enum CardType {
    case Play
    case Customize
    case Rules
}

struct HomeCardModel {
    var title: String!
    var description: String!
    var actionName: String!
    var img: String?
    var type: CardType!
}
