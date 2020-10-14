//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by Wallyson Galvão on 14/10/20.
//

import Foundation

class ItemDao {
    
    func recoveryDir() -> URL? {
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let path = dir.appendingPathComponent("items")
        
        return path
    }
    
    func recovery() -> [Item] {
        guard let path = recoveryDir() else { return [] }
        
        do {
            let data = try Data(contentsOf: path)
            guard let items = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Item> else { return [] }
            
            return items
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func save(_ items: [Item]) {
        guard let path = recoveryDir() else { return }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
}
