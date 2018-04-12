//
//  PlayersViewController.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/11/18.
//  Copyright © 2018 MacPro1. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class PlayersViewController: UIViewController {
    @IBOutlet weak var create_group_btn: UIBarButtonItem!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var disposeBag = DisposeBag()
    lazy var playerViewModel: PlayersViewModel = {
      return PlayersViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRx()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showNavigationBar()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
       collectionView.dataSource = self
       collectionView.delegate = self
        playerViewModel.setupCollectionView(collectionView: collectionView)
    }
    
    func setupRx() {
        
        playerViewModel.updatedContent.subscribe(onNext: { () in
            self.collectionView.reloadData()
        }).disposed(by: disposeBag)
        
        create_group_btn.rx.tap.asDriver().drive(onNext: { () in
          self.playerViewModel.createGroupName(view: self)
        }).disposed(by: disposeBag)
    }
    

    
    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        if(segue.identifier == SBIdentifier.GroupPlayerToDetail.rawValue) {
            let controller: GroupPlayerDetailsViewController = segue.destination as! GroupPlayerDetailsViewController
            controller.group = (sender as! GroupPlayerModal)
            
        }
     }

}

extension PlayersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerViewModel.getNumberOfGroup()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : GroupPlayerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupPlayerID", for: indexPath) as! GroupPlayerCollectionViewCell
        let group = playerViewModel.getGroupItemBy(index: indexPath.row)
        cell.group.value = group
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Caculate for 2 item in a row
        let size = (screenWidth - 12) / 2
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let group = playerViewModel.getGroupItemBy(index: indexPath.row)
        self.pushToView(by: SBIdentifier.GroupPlayerToDetail.rawValue, sender: group)
    }
    
}
