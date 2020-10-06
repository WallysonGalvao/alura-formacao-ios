//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Wallyson Galvão on 06/10/20.
//

import UIKit

class Alert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(title: String = "Sorry", message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let closeBtn = UIAlertAction(title: "close", style: .cancel, handler: nil)
        
        alert.addAction(closeBtn)
        controller.present(alert, animated: true, completion: nil)
    }
    
}
