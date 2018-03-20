//
//  ShopService.swift
//  Task
//
//  Created by Lakeba_Prabhu on 03/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import Foundation

class ShopService {
    
    static let shopService = ShopService()
    
    //MARK : Instance Methods
    
    // To Get list of Products from local .JSON file
    public func fetchShoppingProducts() -> [Product] {

        var shoppingProducts = [Product]()

        guard let path = Bundle.main.path(forResource: "products", ofType: "json") else {
            print("JSON file not found")
            return shoppingProducts
        }
        
        do{
            
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            
            if let productsList = jsonResult as? [[String:String]] {
                
                for productInfo in productsList {
                    
                    shoppingProducts.append(Product(productId: productInfo["product_id"]!, name: productInfo["product_name"]!, manufacturer: productInfo["product_manufacturer"]!, information: productInfo["product_description"]!, offerPrice: productInfo["offer_price"]!, price: productInfo["price"]!, rating: productInfo["rating"]!, imgURL: productInfo["product_image_url"]!, purchasedQty: 0))
                    
                }
                
            }
            
        }
        catch {
            print("Cannot produce the product")
        }
        return shoppingProducts
        
    }
    
}

