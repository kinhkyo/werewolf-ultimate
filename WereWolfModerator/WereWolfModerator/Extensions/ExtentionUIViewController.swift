//
//  ExtentionUIViewController.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/10/18.
//  Copyright © 2018 MacPro1. All rights reserved.
//

import UIKit
extension UIViewController {
    var appDelegate:AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    func showNavigationBar(){
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func hideNavigationBar(){
         self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    func pushToView(by segue: String, sender:Any? = nil) {
       performSegue(withIdentifier: segue, sender: sender)
    }
    // MARK: Alert View
    // Show Alert without UIAlertAction
    func showAlert(title: String, message: String) {
        
    }
    
    // Show Alert with UIAlertAction
    func showAlert(title: String,msg: String,actions:[UIAlertAction]) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    // Show Alert action sheet
    func showAlertSheet(title: String,msg: String,actions:[UIAlertAction]) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .actionSheet)
        for action in actions {
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    // Show error info form Firebase
    func showErrorFirebase(title: String,error: NSError) {
        self.showAlert(title: title, message: error.localizedDescription)
        self.view.isUserInteractionEnabled = true
    }
    
}
