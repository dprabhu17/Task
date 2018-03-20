//
//  HomeViewModel.swift
//  Task
//
//  Created by Lakeba_Prabhu on 03/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import Foundation

class HomeViewModel {

    // MARK : Initialization
    var shopProducts = Variable<[Product]>([])
    
    // MARK : Models
    var shopMgr = ShopService()
    var cartMgr = CartManager.shared
    
    // MARK : Instance Methods
    
    // Fetch product from Shop
    init() {
        shopProducts.value = shopMgr.fetchShoppingProducts()
    }
    
    // Get Shop product info by indexPath
    func getShopProductByIndex(forIndexPath: IndexPath) -> Product{
        return shopProducts.value[forIndexPath.row]
    }
    
    // To Get Total Products count for TableView
    func getProductCountForTableView() -> Int {
        return shopProducts.value.count
    }

    // Add Selected Product to Cart
    func addProductToCart(indexPath: IndexPath){
        cartMgr.addToCart(productToInsert: shopProducts.value[indexPath.row])
    }
    
    // To get Product counts from Cart
    func getCartCount() -> Int {
        return cartMgr.getTotalProductsInCart()
    }
    
}
