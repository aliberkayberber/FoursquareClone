//
//  PlacesViewController.swift
//  FoursquareClone
//
//  Created by Ali Berkay BERBER on 20.03.2023.
//

import UIKit
import Parse
class PlacesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutButtonClicked))
    }
    
    @objc func addButtonClicked() {
        // segue
    }
    @objc func logoutButtonClicked() {
        PFUser.logOutInBackground { error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert , animated: true)
            }
            else {
                //MARK: -- alternative segue 
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
                //self.performSegue(withIdentifier: "toSignUpVC", sender: nil)
            }
        }
    }
}
