//
//  HomeVCTests.swift
//  TaskTests
//
//  Created by Lakeba_Prabhu on 06/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import XCTest

class HomeVCTests: XCTestCase {
    
    // MARK : View Model
    var homeViewModel:HomeViewModel!
    
    // SetUp
    override func setUp() {
        super.setUp()
         homeViewModel = HomeViewModel()
    }
    
    // TestCase : 1 - Load required Products
    func testToLoadProducts(){
        
        XCTAssert(homeViewModel.shopProducts.value.count > 0)
        
    }

    // TestCase : 2 - Add Product To Cart
    func testToAddAProductToCart(){
        
        let previousQuantity: Int = homeViewModel.getCartCount()
        
        // Add a Product
        let indexPathToAdd: IndexPath = IndexPath.init(row: 0, section: 1)
        homeViewModel.addProductToCart(indexPath: indexPathToAdd)

        // Test
        XCTAssert(homeViewModel.getCartCount() > previousQuantity)
        
    }
    
    // TestCase : 3 - Get Total Number of Products in Cart to display it in HeaderView
    func testToGetProductsCountFromCart() {
        
        XCTAssert(homeViewModel.getCartCount() > 0)
        
    }
    
    override func tearDown() {
        super.tearDown()
        // Clear the Memory
        homeViewModel = nil
    }
    
}
