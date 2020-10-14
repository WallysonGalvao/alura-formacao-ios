//
//  MealDao.swift
//  eggplant-brownie
//
//  Created by Wallyson Galvão on 14/10/20.
//

import Foundation


class MealDao {
    
    func recoveryDir() -> URL? {
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let path = dir.appendingPathComponent("meal")
        
        return path
    }
    
    func recovery() -> [Meal] {
        guard let path = recoveryDir() else { return [] }
        
        do {
            let data = try Data(contentsOf: path)
            guard let meals = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Meal> else { return [] }
            
            return meals
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func save(_ meals: [Meal]) {
        guard let path = recoveryDir() else { return }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
}
