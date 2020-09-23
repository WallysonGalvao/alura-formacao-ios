//
//  Item.swift
//  eggplant-brownie
//
//  Created by Wallyson Galvão on 18/09/20.
//

import UIKit

class Item: NSObject {
    
    let nome: String
    let calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }

}
