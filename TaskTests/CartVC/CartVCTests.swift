//
//  CartVCTests.swift
//  TaskTests
//
//  Created by Lakeba_Prabhu on 06/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import XCTest

class CartVCTests: XCTestCase {
    
    // MARK : View Model
    var cartViewModel: CartViewModel!
    var homeViewModel: HomeViewModel!
    
    // SetUp
    override func setUp() {
        super.setUp()
        initialize()        
    }
    
    // TestCase : 1 - Get Total Items of Cart
    func testToGetTotalItemsInCart() {
        
        XCTAssert(cartViewModel.getTotalProductsInCart() > 0)
        
    }
    
    // TestCase : 2 - Get Total Price of items in Cart
    func testToGetTotalPrice() {
        
        XCTAssert(cartViewModel.getTotalPrice() > 0)
        
    }
    
    // TestCase : 3 - Get Item's Quantity based on Product
    func testToGetSpecificProductQuantity() {
        
        XCTAssert(cartViewModel.getCartQuantityByProduct(product: self.getAProductFromCart()!) > 0)
        
    }
    
    // TestCase : 4 - To increase the product quantity by 1
    func testToIncreaaseProductQuantity() {
        
        let previousQuantity: Int = cartViewModel.getTotalProductsInCart()
        cartViewModel.increaseCartQuantity(cartProduct: self.getAProductFromCart()!)
        
        //Check the product count has been increased or not
        XCTAssert(cartViewModel.getTotalProductsInCart() > previousQuantity)
        
    }
    
    // TestCase : 5 - To decrease the product quantity by 1
    func testToDecreaseProductQuantity() {
        
        let previousQuantity: Int = cartViewModel.getTotalProductsInCart()
        cartViewModel.decreaseCartQuantity(cartProduct: self.getAProductFromCart()!)
        
        //Check the product count has been decreased or not
        XCTAssert(cartViewModel.getTotalProductsInCart() < previousQuantity)
        
    }
    
    // TestCase : 6 - Remove A Product from Cart
    func testToRemoveAllCartProduct() {
        
        let previousQuantity: Int = cartViewModel.getTotalProductsInCart()
        cartViewModel.removeAllCartProduct(cartProduct: self.getAProductFromCart()!)

        //Check the product count has been increased or not
        XCTAssert(cartViewModel.getTotalProductsInCart() < previousQuantity)

    }
    
    // TestCase : 7 - Clear All products from Cart
    func testToClearAllCartProduct() {
        
        let previousQuantity: Int = cartViewModel.getTotalProductsInCart()
        cartViewModel.clearCart()
        
        //Check the product count has been increased or not
        XCTAssert(cartViewModel.getTotalProductsInCart() <= previousQuantity)
        
    }
    
   // MARK : Instance Metods
    func initialize() {
        
        // Step 1: Initalize and Add a product to Cart By Default
        homeViewModel = HomeViewModel()
        
        let item1Index: IndexPath = IndexPath.init(row: 0, section: 1)
        homeViewModel.addProductToCart(indexPath: item1Index)
        homeViewModel.addProductToCart(indexPath: item1Index) // To increase it's qty by 1
        
        let item2Index: IndexPath = IndexPath.init(row: 0, section: 1)
        homeViewModel.addProductToCart(indexPath: item2Index)
        
        // Step 2: Initialize Cart View Model to Test
        cartViewModel = CartViewModel()
        
    }

    // To Get a Product From Cart
    func getAProductFromCart() -> Product? {
        
        if cartViewModel.cartProducts.value.count > 0 {
            return cartViewModel.cartProducts.value[0]
        }
        return nil
        
    }
    
    override func tearDown() {
        super.tearDown()
        // Clear the Memory
        homeViewModel = nil
        cartViewModel = nil
        
    }
    
}
