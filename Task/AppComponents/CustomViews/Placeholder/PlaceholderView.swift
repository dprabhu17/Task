//
//  PlaceholderView.swift
//  Task
//
//  Created by Prabhu
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class PlaceholderView: UIView {

    @IBOutlet var vwContent: UIView!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var imgPlaceHolder: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        
        Bundle.main.loadNibNamed("PlaceholderView", owner: self, options: nil)
        addSubview(vwContent)
        vwContent.frame = self.bounds
        vwContent.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    func setPlaceholderWithImg(imgName: String, message: String){
        
        lblMessage.text = message
        imgPlaceHolder.image = UIImage.init(named: imgName)
        
    }

    func setPlaceholder(message: String){
        lblMessage.text = message
    }

}
