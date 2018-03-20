//
//  UIColor+App.swift
//  Task
//
//  Created by Lakeba_Prabhu on 03/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    static var appGreen: UIColor{
        return UIColor(rgb: 0x1E7D23)
    }

    static var appOrange: UIColor{
        return UIColor(rgb: 0xF77342)
    }
    
    static var alertColor: UIColor{
        return UIColor(rgb: 0xF90A7A)
    }
    
    static var appDarkBlue: UIColor{
        return UIColor(rgb: 0x000080)
    }
    static var statusBarColor: UIColor{
        return UIColor(rgb: 0x2874EF)
    }
    
    
}
