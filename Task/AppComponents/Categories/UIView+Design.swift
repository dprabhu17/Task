//
//  UIView+Design.swift
//  Task
//
//  Created by Lakeba_Prabhu on 04/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setAsRoundedCorner(cornerRadius:CGFloat, borderWidth: CGFloat, borderColor:UIColor){
        
        //Corner Radius
        self.layer.cornerRadius = cornerRadius;
        self.clipsToBounds = true;
        
        //Add borders
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = borderColor.cgColor;
        
    }
    
    func setAsCardView(){
        
        self.layer.cornerRadius = 2
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 2)
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3);
        layer.shadowOpacity = 0.2
        layer.shadowPath = shadowPath.cgPath
        
    }
    
    func setAsRound(borderWidth: CGFloat, borderColor:UIColor){
        
        //Corner Radius
        self.layer.cornerRadius = self.frame.size.width / 2;
        self.clipsToBounds = true;
        
        //Add borders
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = borderColor.cgColor;
    }
}
