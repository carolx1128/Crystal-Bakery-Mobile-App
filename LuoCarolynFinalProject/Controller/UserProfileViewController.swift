//
//  UserProfileViewController.swift
//  LuoCarolynFinalProject
//
//  Created by Carolyn Luo on 4/28/23.
//

import UIKit
import Firebase
import GoogleSignIn

class UserProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Utilities.styleFilledButton(logOutButton, 1)
        var email = "User"
        if let user = Auth.auth().currentUser {
            if user.email != nil {
                email = user.email!
            }
        }
        if let user = GIDSignIn.sharedInstance.currentUser {
            if user.profile?.email != nil {
                email = user.profile!.email
            }
        }
        self.emailLabel.text = "Welcome, " + email + "!"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // logging out of the account no matter it is google sign in or regular sign in
    @IBAction func logOutTapped(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        GIDSignIn.sharedInstance.signOut()
        ItemsModel.sharedInstance.setDefaultQuantity()
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "rootViewController")
        self.view.window?.rootViewController = vc
        self.view.window?.makeKeyAndVisible()
    }
    
    // bring up the photo gallery to change user profile picture when the button is tapped
    @IBAction func changeProfilePictureTapped(_ sender: UIButton) {
        let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            present(picker, animated: true, completion: nil)
    }
    
    // allow the user to upload picture from default gallery
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            profilePictureImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }

    // done click dismiss the window of gallery
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
