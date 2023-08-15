//
//  SignUpViewController.swift
//  LuoCarolynFinalProject
//
//  Created by Carolyn Luo on 4/28/23.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Utilities.styleTextField(emailTextField, 2)
        Utilities.styleTextField(passwordTextField, 2)
        Utilities.styleFilledButton(signUpButton, 2)
        emailTextField.text = ""
        passwordTextField.text = ""
        emailTextField.becomeFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func signUpTapped(_ sender: UIButton) {
        // if any field is empty, generate error
        let email = emailTextField.text!
        let password = passwordTextField.text!
        if email.isEmpty || password.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Please fill in both email and password!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
            print("Either email or password is empty")
            return
        }
        
        // if email is invalid, generate error
        if (Utilities.isEmailValid(email) == false) {
            let alert = UIAlertController(title: "Error!", message: "Please fill in a valid email address!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
            return
        }
        
        // Create user instance in the Firebase Auth database:
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                let alert = UIAlertController(title: "Sign Up Failure", message: "Failed to sign up your account", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self!.present(alert, animated: true, completion: nil)
                print("An error has occured: \(error)")
                return
            }
            
            if let userID = authResult?.user.uid {
                print("User signed up successfully! Uses's ID: \(userID)")
//                self!.performSegue(withIdentifier: "signUp", sender: self)
            }
           
        }
    }
}
