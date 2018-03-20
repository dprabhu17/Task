//
//  CartViewModel.swift
//  Task
//
//  Created by Lakeba_Prabhu on 03/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import Foundation

class CartViewModel {
    
    // MARK : Initialization
    var cartProducts = Variable<[Product]>([])
    
    // MARK : Models
    var cartMgr = CartManager.shared
    
    // MARK : Instance Methods
    init() {
        cartProducts = cartMgr.products
    }
    
    // Get Cart product info by indexPath
    func getCartProductForTableViewCell(forIndexPath: IndexPath) -> Product{
        return cartProducts.value[forIndexPath.row]
    }
    
    // To Get Total Product count for TableView
    func getProductCountForTableView() -> Int {
        return cartProducts.value.count
    }
    
    // To Get Quantity of specific product
    func getCartQuantityByProduct(product: Product) -> Int {
        return cartMgr.getCartQuantityByProduct(productInfo: product) 
    }
    
    // Get Total Products in Cart
    func getTotalProductsInCart() -> Int {
        return cartMgr.getTotalProductsInCart() > 0 ? cartMgr.getTotalProductsInCart() : 0
    }
    
    // To Get Total price of Cart's products
    func getTotalPrice() -> Double {
        return cartMgr.totalPrice() > 0.0 ? cartMgr.totalPrice() : 0.0
    }
    
    // Increase Cart Quantity by 1
    func increaseCartQuantity(cartProduct: Product) {
        cartMgr.increaseProductQuantity(productInfo: cartProduct)
    }
    
    // Decrease Cart Quantity by 1
    func decreaseCartQuantity(cartProduct: Product) {
        cartMgr.decreaseProductQuantity(productInfo: cartProduct)
    }
    
    // Remove All Product by it's size
    func removeAllCartProduct(cartProduct: Product) {
        cartMgr.removeAllProduct(productInfo: cartProduct)
    }
    
    // Reset Cart
    func clearCart() {
        
        cartMgr.resetCard()
        
    }
}

