//
//  Item.swift
//  LuoCarolynFinalProject
//
//  Created by Carolyn Luo on 4/28/23.
//

import Foundation

// Item object to store product information
struct Item {
    var name: String = ""
    var price: Double = 0.0
    var quantity = 0
    
    init(name: String, price: Double, quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }
    
    // retrieve the name of the item
    func getName() -> String {
        return self.name
    }
    
    // retrieve the price of the item
    func getPrice() -> Double {
        return self.price
    }
    
    // retrieve the quantity of the item
    func getQuantity() -> Int {
        return self.quantity
    }
}
