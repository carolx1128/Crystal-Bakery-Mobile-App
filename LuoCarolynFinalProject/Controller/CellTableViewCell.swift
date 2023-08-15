//
//  CellTableViewCell.swift
//  LuoCarolynFinalProject
//
//  Created by Carolyn Luo on 5/1/23.
//

import UIKit

// each table cell has these properties
class CellTableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityStepper: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // when stepper value changes, update the corresponding
    // item's quantity to help calculate the amounts correctly
    @IBAction func stepperChanged(_ sender: UIStepper) {
        quantityLabel.text = "\(Int(sender.value))"
        ItemsModel.sharedInstance.findItemByNameAndSetQuantity(name: nameLabel.text!, quantity: Int(sender.value))
    }
}
