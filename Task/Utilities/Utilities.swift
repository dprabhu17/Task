//
//  Utilities.swift
//  Task
//
//  Created by Lakeba_Prabhu on 04/03/18.
//  Copyright © 2018 Prabhu. All rights reserved.
//

import Foundation

class Utilities: NSObject  {
    
    static let shared = Utilities()

    //Avoid basic init using () instead of sharedManager
    private override init() {
        super.init()
    }
    
    static func showAlertMessage(title: String, message: String, type: Theme){
        
        let validationAlert = MessageView.viewFromNib(layout: .messageView)
        validationAlert.configureTheme(type)
        validationAlert.button?.setTitleColor(.white, for: .normal)
        
        validationAlert.backgroundColor = (type == .success) ? UIColor.alertColor : UIColor.statusBarColor
        validationAlert.configureDropShadow()
        
        var validationConfig = SwiftMessages.Config()
        validationConfig.duration = .automatic
        validationConfig.interactiveHide = true
        validationConfig.presentationStyle = .bottom
        
        validationAlert.configureContent(title: title, body: message)
        validationAlert.button?.isHidden = true
        
        SwiftMessages.hideAll()
        SwiftMessages.show(config: validationConfig, view: validationAlert)
        
    }

    //MARK: Place holder for UITableView
    static func setPlaceholderForTableView(tableView: UITableView, dataSource:[Any], messageToDisplay: String) -> Int {
        
        if dataSource.count > 0 {
            
            tableView.backgroundView = nil
            return 1
            
        }
        else {
            
            let placeHolder:PlaceholderView = PlaceholderView.init(frame: tableView.frame)
            tableView.backgroundView = placeHolder
            placeHolder.setPlaceholder(message: messageToDisplay)
            return 0
            
        }
    }
}

