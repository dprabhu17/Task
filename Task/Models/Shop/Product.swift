//
//  Product.swift
//  Task
//
//  Created by Lakeba_Prabhu on 03/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import Foundation

// Model to store product information
public struct Product {
    
    public var productId: String
    public var name: String
    public var manufacturer: String
    public var information: String
    public var offerPrice: String
    public var price: String
    public var rating: String
    public var imgURL: String
    public var purchasedQty: Int
    
    // MARK : Instance Methods
    // To Create a product with it's properties
    init(productId: String, name: String, manufacturer: String, information: String, offerPrice: String, price: String, rating: String, imgURL: String, purchasedQty: Int) {
        
        self.productId = productId
        self.name = name
        self.manufacturer = manufacturer
        self.information = information
        self.offerPrice = offerPrice
        self.price = price
        self.rating = rating
        self.imgURL = imgURL
        self.purchasedQty = purchasedQty
        
    }
    
}

