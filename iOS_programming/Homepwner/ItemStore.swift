//
//  ItemStore.swift
//  Homepwner
//
//  Created by Shim Sooyeon on 2017. 10. 1..
//  Copyright © 2017년 Shim Sooyeon. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
}
