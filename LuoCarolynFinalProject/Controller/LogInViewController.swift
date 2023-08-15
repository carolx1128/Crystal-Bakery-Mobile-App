//
//  LogInViewController.swift
//  LuoCarolynFinalProject
//
//  Created by Carolyn Luo on 4/28/23.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var googleSignInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Utilities.styleTextField(emailTextField, 3)
        Utilities.styleTextField(passwordTextField, 3)
        Utilities.styleFilledButton(logInButton, 3)
        Utilities.styleFilledButton(googleSignInButton, 2)
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
    
    // regular login with firebase
    @IBAction func logInTapped(_ sender: Any) {
        // if any field is empty, generate error
        let email = emailTextField.text!
        let password = passwordTextField.text!
        // present alert to ask user to enter all fields
        if email.isEmpty || password.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Please enter both email and password fields.", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
            emailTextField.text = ""
            passwordTextField.text = ""
            return
        }
        
        if Utilities.isEmailValid(email) == false {
            let alert = UIAlertController(title: "Error", message: "Please enter a properly formatted Email address.", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
            emailTextField.text = ""
            passwordTextField.text = ""
            return
        }
        // authentification alert
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: "Email password mismatch!", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self!.present(alert, animated: true, completion: nil)
                print("An error has occured during login: \(error)")
                return
            }
            self?.performSegue(withIdentifier: "homeSegue", sender: self)
        }
    }
    
    // google log in functionality
    @IBAction func googleSignInTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            if let error = error {
                let alert = UIAlertController(title: "Error", message: "Google Log in failed!", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                print("An error has occured during login: \(error)")
                return
            }
            // If sign in succeeded, display the app's main content View.
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "tabVC")
            self.view.window?.rootViewController = vc
            self.view.window?.makeKeyAndVisible()
          }
    }
    
}
