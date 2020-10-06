//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Wallyson Galvão on 18/09/20.
//

import UIKit

class Meal: NSObject {
    
    // MARK: - Attributes
    
    let name: String
    let happiness: Int
    var itens: Array<Item> = []
    
    // MARK: - Construtor
    
    init(name: String, happiness: Int, itens: [Item] = []) {
        self.name = name
        self.happiness = happiness
        self.itens = itens
    }
    
    // MARK: - Methods
    
    func totalCalories() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calories
        }
        
        return total
    }
    
    func details() -> String {
        var message = "Happiness: \(happiness)"
        
        for item in itens {
            message += ", \(item.name) - calories: \(item.calories)"
        }
        
        return message
    }

}
