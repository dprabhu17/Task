//
//  String+Conversion.swift
//  Task
//
//  Created by Lakeba_Prabhu on 04/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import Foundation

extension String {
    
    func getStrikedAttributedString() -> NSMutableAttributedString {
        
        let strikeOutString: NSMutableAttributedString =  NSMutableAttributedString(string: self)
        strikeOutString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, strikeOutString.length))
        return strikeOutString
        
    }

    func getOfferPercentage(originalPrice: String) -> String {
        
        guard let offerPrice = Float(self) else {
            return ""
        }
        guard let actualPrice = Float(originalPrice) else {
            return ""
        }
        let decreasedPrice = actualPrice - offerPrice
        return String("\(Int(( decreasedPrice / actualPrice ) * 100))% Offer")
        
    }
    
}
