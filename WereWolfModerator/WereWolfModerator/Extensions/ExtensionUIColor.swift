//
//  ExtensionUIColor.swift
//  WereWolfModerator
//
//  Created by Macbook Giap on 4/11/18.
//  Copyright © 2018 MacPro1. All rights reserved.
//
import UIKit
import DynamicColor


extension UIColor {
    
    struct Card {
        static let blue   = UIColor(hexString: "#3498db")
        static let red    = UIColor(hexString: "#e74c3c")
        static let yellow = UIColor(hexString: "#f1c40f")
        
        static let gradient = DynamicGradient(colors: [Card.blue, Card.red, Card.yellow])
        static let MayaBlue = UIColor(hex: "#73ACF8")
        static let rgbPalette = Card.gradient.colorPalette(amount: 8)
        static let playerCard = UIColor(hexString: "#E5ECED")

    }
}


