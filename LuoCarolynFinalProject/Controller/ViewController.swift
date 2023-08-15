//
//  ViewController.swift
//  LuoCarolynFinalProject
//
//  Created by Carolyn Luo on 4/28/23.
//

import UIKit

// entry page
class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var aboutUsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // style the buttons
        Utilities.styleFilledButton(signUpButton, 1)
        Utilities.styleHollowButton(logInButton)
        Utilities.styleHollowButton(aboutUsButton)
    }
}

