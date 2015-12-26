//
//  UIAlertController+Convenience.swift
//  Vehicles
//
//  Created by Ryan Poplin on 12/26/15.
//  Copyright © 2015 Razeware, LLC. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    // decorator pattern
    
    class func alertControllerWithTitle(title: String, message: String, buttonTitle: String) -> UIAlertController {
        
        // factory pattern
        
        let controller = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        controller.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        
        return controller
    
    }
    
    class func alertControllerWithTextField(title: String, message: String, buttonTitle: String, handler: (Int?) -> Void) -> UIAlertController {
    
        // factory pattern
        
        let controller = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        controller.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        
        controller.addTextFieldWithConfigurationHandler({
            $0.keyboardType = .NumberPad
        })
        
        controller.addAction(UIAlertAction(title: buttonTitle, style: .Default) { action in
            if let value = controller.textFields?[0].text {
                handler(Int(value))
            }
        })
    
        return controller
        
    }

}