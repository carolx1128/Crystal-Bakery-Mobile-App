//
//  CheckOutViewController.swift
//  LuoCarolynFinalProject
//
//  Created by Carolyn Luo on 5/1/23.
//

import UIKit

class CheckOutViewController: UIViewController {
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var tax = 0.0
    var subtotal = 0.0
    var total = 0.0
    // update the labels to display the correct amounts for each category
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        update()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update the UI with the new data
        update()
    }
    
    // update the value of tax, subtotal, and total text fields
    func update() {
        tax = 0.0
        subtotal = 0.0
        total = 0.0
        for item in ItemsModel.sharedInstance.allItems() {
            subtotal += item.getPrice() * Double(item.getQuantity())
        }
        subtotalLabel.text = "$\(String(format: "%.02f", subtotal))"
        tax = 0.0625 * subtotal // Massachusetts tax rate on food
        taxLabel.text = "$\(String(format: "%.02f", tax))"
        total = subtotal + tax
        totalLabel.text = "$\(String(format: "%.02f", total))"
    }

}
