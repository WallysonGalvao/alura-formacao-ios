//
//  AddItensViewController.swift
//  eggplant-brownie
//
//  Created by Wallyson Galvão on 23/09/20.
//

import UIKit

protocol AddItensDelegate {
    func add(_ item: Item)
}

class AddItensViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var caloriesTextField: UITextField!
    
    // MARK: - Attributes
    var delegate: AddItensDelegate?
    
    init(delegate: AddItensDelegate) {
        super.init(nibName: "AddItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction

    @IBAction func addItem(_ sender: Any) {
        
        guard let name = nameTextField.text else { return }
        guard let calories = caloriesTextField.text else { return }

        if let caloriesNumber = Double(calories) {
            let item = Item(name: name, calories: caloriesNumber)
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
        
    }

}
