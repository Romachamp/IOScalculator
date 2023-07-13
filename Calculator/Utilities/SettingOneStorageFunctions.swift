//
//  SettingOneStorage.swift
//  Calculator
//
//  Created by Роман on 11.06.2023.
//

import Foundation

class StorageFunctions {
        
    func setValue(value: String, key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func getValue(key: String) -> Bool {
        let data = UserDefaults.standard.string(forKey: key)
        if (data == "true") {
            return true
        } else {
            return false
        }
    }
    
}
