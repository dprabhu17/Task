//
//  CartService.swift
//  Task
//
//  Created by Lakeba_Prabhu on 03/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import Foundation

class CartManager: NSObject {
    
    static let shared = CartManager()
    
    // MARK : Properties
    var products = Variable<[Product]>([])

    // MARK : Instance Methods
    
    // Avoid basic init using () instead of sharedManager
    private override init() {
        super.init()
    }

    // To Get Total Price of the products from Cart
    func totalPrice() -> Double {
        
        return products.value.map{ item in
                                    Double(item.purchasedQty) * (item.offerPrice as NSString).doubleValue
                                  }.reduce(0, +)

    }
    
    // To Product Quantity by It's Id
    func getCartQuantityByProduct(productInfo: Product) -> Int {
        return products.value.filter({item in item.productId == productInfo.productId}).map({ item in item.purchasedQty}).reduce(0, +)
    }
    
    // To Get Total Product in cart
    func getTotalProductsInCart() -> Int {
        return products.value.map({ item in item.purchasedQty}).reduce(0, +)
    }
    
    // To Get Qty of Products based on productId
    func getPurchasedProductQuantity(productInfo: Product) -> Int {
        return products.value.map{ value in value.purchasedQty }.reduce(0, +)
    }
    
    // To Increase the Product Quantity By 1
    func increaseProductQuantity(productInfo: Product) {
        self.addToCart(productToInsert: productInfo)
    }
    
    // To Decrease the Product Quantity By 1
    func decreaseProductQuantity(productInfo: Product) {
        
        if let index = products.value.index(where: { item in item.productId == productInfo.productId }) {
            if products.value[index].purchasedQty > 1 {
                products.value[index].purchasedQty = products.value[index].purchasedQty - 1
            }
            else {
                Utilities.showAlertMessage(title: "Info", message: "Quantity cannot be reduced below 1. You can remove it by clicking on Remove option", type: .warning)
            }
        }
        
    }
    
    // To Remove product from Cart
    func removeAllProduct(productInfo: Product) {
        
        if let index = products.value.index(where: { item in item.productId == productInfo.productId }) {
            products.value.remove(at: index)
        }

    }
    
    // To clear All products from Cart
    func resetCard() {
        
        products.value.removeAll()
        
    }
    
    // To Add Items to Cart
    func addToCart(productToInsert: Product) {
        
        if let index = products.value.index(where: { item in item.productId == productToInsert.productId }) {
            products.value[index].purchasedQty = products.value[index].purchasedQty + 1
        }
        else {
            
            var newItem = productToInsert
            newItem.purchasedQty = 1
            products.value.append(newItem)
            
        }
        
    }
    
}
