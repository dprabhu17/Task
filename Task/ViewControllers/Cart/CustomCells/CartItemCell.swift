//
//  CartItemCell.swift
//  Task
//
//  Created by Lakeba_Prabhu on 04/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import UIKit

class CartItemCell: UITableViewCell {
    
    static let Identifier = "CartItemCell"
    
    // MARK : UIElements
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblManufacturer: UILabel!
    @IBOutlet weak var lblOfferPrice: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblOfferDifference: UILabel!
    
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var btnDecrease: UIButton!
    @IBOutlet weak var btnIncrease: UIButton!
    
    @IBOutlet weak var vwOptions: UIView!
    @IBOutlet weak var vwContainer: UIView!
    
    //Products
    var currentProduct: Product?
    var cartViewModel: CartViewModel?
    
    // MARK : Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        buildUI()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.vwContainer.setAsCardView()
    }
    
    //MARK : Instance Methods
    private func buildUI() {
        
        btnIncrease.setAsRoundedCorner(cornerRadius: 5.0, borderWidth: 1.0, borderColor:
            UIColor(rgb: 0xEBEBF1))
        btnDecrease.setAsRoundedCorner(cornerRadius: 5.0, borderWidth: 1.0, borderColor: UIColor(rgb: 0xEBEBF1))
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
    }
    
    func configureWithProduct(product: Product, viewModel: CartViewModel) {
        
        currentProduct = product
        cartViewModel = viewModel
        
        lblProductName.text = product.name
        lblManufacturer.text = String("By \(product.manufacturer)")
        lblOfferPrice.text = String("₹: \(product.offerPrice)")
        lblPrice.attributedText = String("₹: \(product.price)").getStrikedAttributedString()
        imgProduct.image = UIImage(named: product.imgURL )
        lblOfferDifference.text = product.offerPrice.getOfferPercentage(originalPrice: product.price)
        
        let productQantity: Int = (cartViewModel?.getCartQuantityByProduct(product: currentProduct!))!
        lblQuantity.text = "\(productQantity)"
        
        
    }
    
    // MARK : Actions
    @IBAction func decreaseQty(_ sender: Any) {
        cartViewModel?.decreaseCartQuantity(cartProduct: currentProduct!)
        
    }
    
    @IBAction func increaseQty(_ sender: Any) {
        cartViewModel?.increaseCartQuantity(cartProduct: currentProduct!)
    }
    
    @IBAction func removeAll(_ sender: Any) {
        cartViewModel?.removeAllCartProduct(cartProduct: currentProduct!)
    }
    
}
