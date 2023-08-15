//
//  MenuViewController.swift
//  LuoCarolynFinalProject
//
//  Created by Carolyn Luo on 4/30/23.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // display information for each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as? CellTableViewCell
        if cell == nil {
            cell = CellTableViewCell(style: .default, reuseIdentifier: "defaultCell")
        }
        cell!.quantityLabel.text =  "\(ItemsModel.sharedInstance.item(at: indexPath.row)!.quantity)"
        cell!.nameLabel.text = ItemsModel.sharedInstance.item(at: indexPath.row)?.getName()
        cell!.img.image = UIImage(named: (ItemsModel.sharedInstance.item(at: indexPath.row)?.getName())!)
        return cell!
    }
    
    // number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemsModel.sharedInstance.numberOfItems()
    }
}
