//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Wallyson Galvão on 18/09/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeTextFiled: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?

    
    @IBAction func adicionar(_ sender: Any) {
        
        
        guard let nome = nomeTextFiled?.text else {
            return
        }
        
        guard let felicidadeS = felicidadeTextField?.text,
              let felicidade = Int(felicidadeS) else {
            return
        }
        
        let refeicao = Refeicao(nome: nome, felicidade: felicidade)
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
    }


}

