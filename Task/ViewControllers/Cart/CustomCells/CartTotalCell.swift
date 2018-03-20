//
//  CartTotalCell.swift
//  Task
//
//  Created by Lakeba_Prabhu on 04/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import UIKit

class CartTotalCell: UITableViewHeaderFooterView {

    static let Identifier = "CartTotalCell"
    
    // MARK : UIElements
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    
    var cartViewModel: CartViewModel?
    
    // MARK : LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        vwContainer.setAsCardView()
    }
    
    //MARK : Instance Methods
    func configureWithViewModel(viewModel: CartViewModel) {
        
        cartViewModel = viewModel
        lblQuantity.text = "(\((cartViewModel?.getTotalProductsInCart())!))"
        lblTotalPrice.text = "₹ \((cartViewModel?.getTotalPrice())!)"
        
    }
    
}
