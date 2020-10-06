//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Wallyson Galvão on 23/09/20.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AddMealDelegate {
    var meals = [Meal(name: "Macarrao", happiness: 5),
                 Meal(name: "Pizza", happiness: 5),
                 Meal(name: "Ovo", happiness: 5)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let meal = meals[indexPath.row]
        cell.textLabel?.text = meal.name
        
        let longPress = UILongPressGestureRecognizer(target:  self, action:  #selector(showDetails(_:)))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    func add(_ meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    @objc func showDetails(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let cell = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: cell) else { return  }
            
            let meal = meals[indexPath.row]
            
            let alert = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: .alert)
            let closeBtn = UIAlertAction(title: "close", style: .cancel, handler: nil)
            
            alert.addAction(closeBtn)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
       
    }
}
