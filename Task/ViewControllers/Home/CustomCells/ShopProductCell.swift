//
//  ShopProductCell.swift
//  Task
//
//  Created by Lakeba_Prabhu on 04/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import UIKit

class ShopProductCell: UITableViewCell {

    static let Identifier = "ShopProductCell"
    
    // MARK : UIElements
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblManufacturer: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblOfferPrice: UILabel!
    @IBOutlet weak var lblOriginalPrice: UILabel!
    @IBOutlet weak var lblOfferDifference: UILabel!
    @IBOutlet weak var vwRating: UIView!
    @IBOutlet weak var vwContainer: UIView!
    
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
    
    // MARK : Instance Methods
    private func buildUI(){
        
        vwContainer.setAsRoundedCorner(cornerRadius: 5.0, borderWidth: 1.0, borderColor: UIColor.white)
        vwRating.setAsRoundedCorner(cornerRadius: 5.0, borderWidth: 1.0, borderColor: vwRating.backgroundColor!)
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
    }
    
    func configureWithProduct(product: Product) {
        
        lblProductName.text = product.name
        lblManufacturer.text = String("By \(product.manufacturer)")
        lblRating.text = product.rating
        lblOfferPrice.text = String("₹: \(product.offerPrice)")
        lblOriginalPrice.attributedText = String("₹: \(product.price)").getStrikedAttributedString()
        imgProduct.image = UIImage(named: product.imgURL )
        lblOfferDifference.text = product.offerPrice.getOfferPercentage(originalPrice: product.price)
        
    }
    
}
