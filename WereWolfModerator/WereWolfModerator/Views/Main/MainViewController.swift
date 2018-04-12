//
//  MainViewController.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/10/18.
//  Copyright (c) 2018 MacPro1. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
  
    @IBOutlet weak var tvView: UITableView!
    lazy var mainViewModel : MainViewModel =  {
        return MainViewModel()
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupLayout()
        setupRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideNavigationBar()
    }
}

// MARK: Setup
private extension MainViewController {

    func setupViews() {
        tvView.delegate = self
        tvView.dataSource = self
        mainViewModel.setupTableView(tableView: tvView)
       
    }

    func setupLayout() {
    
    }

    func setupRx() {
    
    }
    func cellAction(actionType: CardType) {
        self.pushToView(by: SBIdentifier.MainToCustomize.rawValue)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.numberOfMainMenu
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainTableViewCell  = tableView.dequeueReusableCell(withIdentifier: "MainCellID", for: indexPath) as! MainTableViewCell
        let card = mainViewModel.getCardAt(index: indexPath.row)
        cell.card.value = card
        
        cell.action_btn.rx.tap.asDriver().drive(onNext: { ()  in
            self.cellAction(actionType: cell.card.value.type)
        }).disposed(by: cell.disposeBag)
        return cell
    }
    
}
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}


