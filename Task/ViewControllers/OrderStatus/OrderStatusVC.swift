//
//  OrderStatusVC.swift
//  Task
//
//  Created by Lakeba_Prabhu on 06/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import UIKit

class OrderStatusVC: UIViewController {

    // MARK : UIElements
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var btnDone: UIButton!
    
    var cartViewModel = CartViewModel()
    
    // MARK : Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buildUI()
    }
    
    // MARK : Instance Methods
    private func buildUI(){
        buildHeaderView()
    }
    
    // Build Dynamic Navigation Header with Custom .xib
    private func buildHeaderView(){
        
        headerView.setTitle(title: "Ready For Delivery!")
        headerView.HideAllButtons()
        btnDone.setAsRoundedCorner(cornerRadius: 5.0, borderWidth: 1.0, borderColor: UIColor.white)
        
    }
    
    // UIElement Actions
    @IBAction func done(_ sender: Any) {
        
        cartViewModel.cartProducts.value.removeAll()
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    

}
