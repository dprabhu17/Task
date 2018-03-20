//
//  HeaderView.swift
//  Task
//
//  Copyright © 2018 Prabhu. All rights reserved.
//

import UIKit

@objc protocol HeaderViewDelegate: class {
    @objc optional func didRightButtonClicked()
    @objc optional func didLeftButtonClicked()
}

class HeaderView: UIView {
    
    // MARK : UIElements
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    
    // MARK : Instance Variables
    private var presentVC:UIViewController?
    private var navigationVC:UINavigationController?
    
    // By Default It's Back Button
    var customLeftMenu: Bool = false
    var delegate: HeaderViewDelegate?
    
    // MARK : Lifecycle Methods
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
        self.buildUI()
        
    }
    
    // Mark : UIElement Actions
    @IBAction func leftButtonClicked(_ sender: Any) {
        
        if customLeftMenu {
            delegate?.didLeftButtonClicked!()
        }
        else {
            
            if navigationVC != nil {
                navigationVC?.popViewController(animated: true)
            }
            else{
                presentVC?.dismiss(animated: true, completion: nil)
            }

        }
        
    }
    
    @IBAction func rightButtonClicked(_ sender: Any) {
        delegate?.didRightButtonClicked!()
    }
    
    // MARK : Instance Methods
    func buildUI(){
        lblCount.setAsRound(borderWidth: 1.0, borderColor: UIColor.white)
    }
    
    func setup(){
        
        let views = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        let contentView = views?[0] as! UIView
        contentView.frame = self.bounds
        self.addSubview(contentView)
        
        if let navigationController = UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController {
            navigationVC = navigationController
        }
        
        if let presentViewController = UIApplication.shared.delegate?.window??.rootViewController {
            presentVC = presentViewController
        }
        
    }
    
    func setTitle(title: String){
        
        lblTitle.text = title
        lblTitle.isHidden = false
        
    }

    func setRightButtonTitle(title: String) {
        btnRight.setTitle(title, for: .normal)
        btnRight.isHidden = false
    }

    func HideAllButtons(){
        
        btnRight.isHidden = true
        btnLeft.isHidden = true
        lblTitle.textAlignment = .center
        
    }
    
    func setCartCount(count: Int) {
        
        lblCount.isHidden = count == 0
        lblCount.text = (count > 99) ? "99+" : "\(count)";
        
    }
    
}
