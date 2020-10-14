//
//  RemoveMealViewController.swift
//  eggplant-brownie
//
//  Created by Wallyson Galvão on 13/10/20.
//

import UIKit

class RemoveMealViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ meal: Meal, handler: @escaping (UIAlertAction) -> Void) {
        
        let alert = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: .alert)
        let closeBtn = UIAlertAction(title: "close", style: .cancel, handler: nil)
        let removeBtn = UIAlertAction(title: "remove", style: .destructive, handler: handler) 
        
        alert.addAction(closeBtn)
        alert.addAction(removeBtn)
        
        controller.present(alert, animated: true, completion: nil)
        
    }
}
