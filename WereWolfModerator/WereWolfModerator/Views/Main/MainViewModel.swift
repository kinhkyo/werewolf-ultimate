//
//  MainViewModel.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/10/18.
//  Copyright (c) 2018 MacPro1. All rights reserved.
//

import RxSwift
import Localize_Swift

class MainViewModel {

    var numberOfMainMenu : Int { return itemCard.count }
    private var itemCard: [HomeCardModel] = []
     init() {
        setupRx()
        setupData()
    }
    
    func getCards() -> [HomeCardModel]{
        return itemCard
    }
    func getCardAt(index: Int) -> HomeCardModel{
        return itemCard[index]
    }
    
    func setupTableView(tableView: UITableView){
         tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainCellID")
    }
}

// MARK: Setup
private extension MainViewModel {

    func setupRx() {

    }
    // Data for home view
    func setupData() {
        let card1: HomeCardModel = HomeCardModel(title: WWMString.Home.Card1_Title.localized(), description: WWMString.Home.Card1_Desc.localized(), actionName: WWMString.Home.Card1_Btn,img:"bg_card1", type: .Play)
         let card2: HomeCardModel = HomeCardModel(title: WWMString.Home.Card2_Title.localized(), description: WWMString.Home.Card2_Desc.localized(), actionName: WWMString.Home.Card2_Btn,img:"bg_card2", type: .Customize)
         let card3: HomeCardModel = HomeCardModel(title: WWMString.Home.Card3_Title.localized(), description: WWMString.Home.Card3_Desc.localized(), actionName: WWMString.Home.Card3_Btn,img:"bg_how_to_play", type: .Rules)
        itemCard = [card1, card2, card3]
    }
}
