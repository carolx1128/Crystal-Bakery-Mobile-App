//
//  ItemsModel.swift
//  LuoCarolynFinalProject
//
//  Created by Carolyn Luo on 4/30/23.
//

import Foundation

class ItemsModel {
    private var items: Array<Item> = Array(repeating: Item(name: "", price: 0.0, quantity: 0), count: 9) // array of items that store all of the products of the store
    static let sharedInstance = ItemsModel() // singleton -> sharing data
    private var currentIndex: Int? // current item's index in the array
    
    // initialize all of the items of the store
    init() {
        let names = ["Crispy Durian Cake", "Fruit Cake", "Green Bean Cake", "Marinated Chicken Feet", "Milk Dates", "Mochi", "Snowflake Crisp", "Sweet Green Rice Ball", "Tiger Skin Roll"]
        for i in 0...8 {
            items[i].name = names[i]
            if i == 0 {
                items[i].price = 16.0
            } else if i == 1 {
                items[i].price = 12.0
            } else if i == 2 {
                items[i].price = 16.0
            } else if i == 3 {
                items[i].price = 25.0
            } else if i == 4 {
                items[i].price = 20.0
            } else if i == 5 {
                items[i].price = 13.0
            } else if i == 6 {
                items[i].price = 24.0
            } else if i == 7 {
                items[i].price = 15.0
            } else {
                items[i].price = 25.0
            }
            items[i].quantity = 0
        }
    }
    
    // return the number of items in the array
    func numberOfItems() -> Int {
        return items.count
    }
    
    // return the entire items array
    func allItems() -> Array<Item> {
        return items
    }
    
    // return the item at the current index
    func currentItem() -> Item? {
        if currentIndex == nil {
            return nil
        }
        return items[currentIndex!]
    }
    
    // get an item at a certain index
    func item(at index: Int) -> Item? {
        if index >= items.count || index < 0 {
            return nil
        }
        return items[index]
    }
    
    // finds an item by its name and then set the item's quantity to the given amount
    func findItemByNameAndSetQuantity(name: String, quantity: Int) {
        var index = -1
        for idx in 0...items.count-1 {
            if items[idx].getName() == name {
                index = idx
                break
            }
        }
        if index == -1 {
            print("did not find item")
            return
        }
        ItemsModel.sharedInstance.items[index].quantity = quantity
    }
    
    // set all of the quantity back to 0 upon logging out of the account
    func setDefaultQuantity() {
        for idx in 0...items.count-1 {
            ItemsModel.sharedInstance.items[idx].quantity = 0
        }
    }
    
}
