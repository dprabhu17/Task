//
//  CartVC.swift
//  Task
//
//  Created by Lakeba_Prabhu on 03/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import UIKit

class CartVC: UIViewController {

    // MARK : UIElements
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnPlaceOrder: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    
    // MARK : ViewModel
    var cartViewModel = CartViewModel()
    
    // Memory Mgt
    var disposeBag = DisposeBag()

    
    // MARK : Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buildUI()
    }
    
    // MARK : Instance Methods
    private func buildUI() {

        btnClear.setAsRoundedCorner(cornerRadius: 5.0, borderWidth: 1.0, borderColor: UIColor.white)
        btnPlaceOrder.setAsRoundedCorner(cornerRadius: 5.0, borderWidth: 1.0, borderColor: UIColor.white)
        buildHeaderView()
        registerCell()
        
    }

    
    private func registerCell() {

        let contentCell = UINib(nibName: CartItemCell.Identifier, bundle: nil)
        tableView.register(contentCell, forCellReuseIdentifier: CartItemCell.Identifier)
        
        let footerCell = UINib(nibName: CartTotalCell.Identifier, bundle: nil)
        tableView.register(footerCell, forHeaderFooterViewReuseIdentifier: CartTotalCell.Identifier)
        tableView.estimatedSectionFooterHeight = 90
        
    }
    
    // Build Dynamic Navigation Header with Custom .xib
    private func buildHeaderView(){
        
        headerView.setTitle(title: "Cart")
        listenTotalPrice()
        
    }
    
    //MARK : UIElement Actions    
    @IBAction func placeOrder(_ sender: Any) {
        
        if let orderStatusVC = self.storyboard?.instantiateViewController(withIdentifier: "OrderStatusVC") as? OrderStatusVC {
            self.navigationController?.pushViewController(orderStatusVC, animated: true)
        }

    }
    
    @IBAction func resetCart(_ sender: Any) {
        cartViewModel.clearCart()
    }
    
    // MARK : Observables - RxSwift - To Update Cart's Count
    private func listenTotalPrice() {
        
        cartViewModel.cartProducts.asObservable()
            .subscribe( onNext: { [weak self] results in
                
                if self?.cartViewModel.getTotalProductsInCart() != 0 {
                    self?.btnPlaceOrder.alpha = 1.0
                    self?.btnPlaceOrder.isEnabled = true
                    self?.btnClear.alpha = 1.0
                    self?.btnClear.isEnabled = true
                }
                else{
                    self?.btnPlaceOrder.alpha = 0.5
                    self?.btnPlaceOrder.isEnabled = false
                    self?.btnClear.alpha = 0.5
                    self?.btnClear.isEnabled = false
                }
                
                // Refresh the table to update the changes
                self?.tableView.reloadData()

            }).disposed(by: disposeBag)
        
    }
    
}

// MARK : Tableview DataSource Methods
extension CartVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Utilities.setPlaceholderForTableView(tableView: self.tableView, dataSource: cartViewModel.cartProducts.value, messageToDisplay: "Your Cart is empty!")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartViewModel.getProductCountForTableView()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CartItemCell.Identifier, for: indexPath) as! CartItemCell
        // Load Data from ViewModel
        let productInfo = cartViewModel.getCartProductForTableViewCell(forIndexPath: indexPath)
        cell.configureWithProduct(product: productInfo, viewModel: cartViewModel)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if cartViewModel.cartProducts.value.count > 0 {
           
            let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: CartTotalCell.Identifier) as! CartTotalCell
            // Load Data from ViewModel
            cell.configureWithViewModel(viewModel: cartViewModel)
            return cell
            
        }
        return nil

    }
    
}

// MARK : Tableview Delegate Methods
extension CartVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

