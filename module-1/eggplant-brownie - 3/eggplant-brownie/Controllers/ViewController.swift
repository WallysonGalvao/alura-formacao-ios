//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Wallyson Galvão on 18/09/20.
//

import UIKit

protocol AddMealDelegate {
    func add(_ meal: Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItensDelegate {
    
    // MARK: - Attributes
    
    var delegate: AddMealDelegate?
    
    var itens = [Item(name: "Molho de tomate", calories: 40.0),
                 Item(name: "Queijo", calories: 40.0),
                 Item(name: "Molho apimentado", calories: 40.0),
                 Item(name: "Manjericão", calories: 40.0)]
    
    var selectedItens: [Item] = []
    
    // MARK: - Methods
    
    func add(_ item: Item) {
        itens.append(item)
        
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            Alert(controller: self).show(title: "Sorry", message: "Could not update the table")
        }
    }
    
    func recoveryFromForm() -> Meal? {
        guard let name = nameTextField?.text else {
            Alert(controller: self).show(message: "Error reading the field name")
            return nil
        }
        
        guard let happinessTF = happinessTextField?.text,
              let happiness = Int(happinessTF) else {
            Alert(controller: self).show(message: "Error reading the field happiness")
            return nil
        }
        
        let meal = Meal(name: name, happiness: happiness)
        
        return meal
    }
    
    // MARK: - IBOutlet
    
    @IBOutlet var nameTextField: UITextField?
    @IBOutlet var happinessTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        let addItemButton = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(addItens))
        navigationItem.rightBarButtonItem = addItemButton
    }
    
    @objc func addItens() {
        let addItensViewController = AddItensViewController(delegate: self)
        navigationController?.pushViewController(addItensViewController, animated: true)
        
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let row = indexPath.row
        let item = itens[row]
        
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            let row = indexPath.row
            selectedItens.append(itens[row])
        } else {
            cell.accessoryType = .none
            
            let item = itens[indexPath.row]
            if let position = selectedItens.firstIndex(of: item) {
                selectedItens.remove(at: position)

                for selectedItem in selectedItens {
                    print(selectedItem.name)
                }
            }
        }
    }
    
    // MARK: - IBAction

    @IBAction func adicionar(_ sender: Any) {
        if let meal = recoveryFromForm()  {
            delegate?.add(meal)
            navigationController?.popViewController(animated: true)
        } else {
            Alert(controller: self).show(message: "Error reading data from form")
        }
        
        
    }
}

