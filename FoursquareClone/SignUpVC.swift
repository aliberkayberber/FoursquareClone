//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Ali Berkay BERBER on 15.03.2023.
//

import UIKit
import Parse

class SignUpVC: UIViewController {

    
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func signInClicked(_ sender: Any) {
        
        if userNameText.text != "" && passwordText.text != "" {
            PFUser.logInWithUsername(inBackground: userNameText.text!, password: passwordText.text!) { user, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", massageInput: error?.localizedDescription ?? "Error")
                } else {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "navigationController") as! UINavigationController
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                    //self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        } else {
            makeAlert(titleInput: "Error", massageInput: "Username / Password ??")
        }
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if userNameText.text != "" && passwordText.text != "" {
            let user = PFUser()
            user.username = userNameText.text!
            user.password = passwordText.text!
            user.signUpInBackground { success, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", massageInput: error?.localizedDescription ?? "Error!")
                } else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        } else {
            makeAlert(titleInput: "Error", massageInput: "Username / Password ??")
        }
    }
    func makeAlert(titleInput: String, massageInput: String) {
        let alert = UIAlertController(title: titleInput, message: massageInput, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

