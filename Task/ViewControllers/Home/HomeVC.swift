//
//  HomeVC.swift
//  Task
//
//  Created by Lakeba_Prabhu on 03/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    // MARK : UIElements
    @IBOutlet weak var headerView: HeaderView!    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK : ViewModel
    var homeViewModel = HomeViewModel()
    
    // Memory Mgt
    var disposeBag = DisposeBag()
    
    // MARK : Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loadingb the view.
        buildUI()
    }
    
    
    // MARK : Instance Methods
    private func buildUI(){
        
        buildHeaderView()
        registerCell()

    }
    
    private func registerCell() {
    
        let nib = UINib(nibName: ShopProductCell.Identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ShopProductCell.Identifier)
        
    }
    
    // Build Dynamic Navigation Header with Custom .xib
    private func buildHeaderView(){
    
        headerView.setTitle(title: "Home")
        headerView.btnLeft.isHidden = true
        headerView.btnRight.isHidden = false
        headerView.delegate = self
        
        listenCartUpdate()
    
    }
    
    // Show status message once the item added to the cart
    private func showStatusMessage(productInfo: Product){

        let successMsg: String = "1 \(productInfo.name)  was succesfully added to your shopping cart"
        Utilities.showAlertMessage(title: "Success", message: successMsg, type: .success)

    }
    
    // MARK : Observables - RxSwift - To Update Cart's Count
    private func listenCartUpdate() {
        
        homeViewModel.cartMgr.products.asObservable()
            .subscribe( onNext: { [weak self] results in
                
                self?.headerView.setCartCount(count: (self?.homeViewModel.getCartCount())!)
                
            }).disposed(by: disposeBag)
        
    }
    
}

// MARK : Tableview DataSource Methods
extension HomeVC: UITableViewDataSource {
    
      func numberOfSections(in tableView: UITableView) -> Int {
        return Utilities.setPlaceholderForTableView(tableView: self.tableView, dataSource: homeViewModel.shopProducts.value, messageToDisplay: "No Products found!")
      }

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.getProductCountForTableView()
      }
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Load Data from ViewModel
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopProductCell.Identifier, for: indexPath) as! ShopProductCell
        let productInfo = homeViewModel.getShopProductByIndex(forIndexPath: indexPath)
        cell.configureWithProduct(product: productInfo)        
        return cell
        
      }

}

// MARK : Tableview Delegate Methods
extension HomeVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        homeViewModel.addProductToCart(indexPath: indexPath)
        self.showStatusMessage(productInfo: homeViewModel.getShopProductByIndex(forIndexPath: indexPath))
        
    }

}

// MARK : Custom HeaderView Delegate Methods
extension HomeVC: HeaderViewDelegate {
    
    // Move to Show Cart Page
    func didRightButtonClicked() {
        
        if let cartVC = self.storyboard?.instantiateViewController(withIdentifier: "CartVC") as? CartVC {
            self.navigationController?.pushViewController(cartVC, animated: true)
        }
        
    }
    
}

