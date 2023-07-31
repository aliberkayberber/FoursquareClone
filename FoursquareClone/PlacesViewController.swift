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
    
    var placeNameArray = [(String)]()
    var placeIdArray = [(String)]()
    var selectedPlaceId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutButtonClicked))
        tableView.delegate = self
        tableView.dataSource = self
        getDataFromParse()
    }
    
    func getDataFromParse() {
        
        let query = PFQuery(className: "Places")
        query.findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(titleInput: "Error", massageInput: error?.localizedDescription ?? "Error")
            } else {
                if objects != nil {
                    
                    self.placeNameArray.removeAll(keepingCapacity: false)
                    self.placeIdArray.removeAll(keepingCapacity: false)
                    
                    for object in objects! {
                        if let placeName = object.object(forKey: "name") as? String {
                            if let placeId = object.objectId {
                                self.placeNameArray.append(placeName)
                                self.placeIdArray.append(placeId)
                            }
                        }
                            
                    }
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
    @objc func addButtonClicked() {
        // segue
        performSegue(withIdentifier: "toAddPlaceVC", sender: nil)
    }
    @objc func logoutButtonClicked() {
        PFUser.logOutInBackground { error in
            if error != nil {
                self.makeAlert(titleInput: "Error", massageInput: error?.localizedDescription ?? "Error")
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
    func makeAlert(titleInput: String, massageInput: String) {
        let alert = UIAlertController(title: titleInput, message: massageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert , animated: true)
    }
    
    // MARK: -- diğer sayfaya ulaşmak için segu ile bu kullanılıyor
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailVC
            destinationVC.chosenPlaceId = selectedPlaceId
        }
    }
    
}

extension PlacesViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = placeNameArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPlaceId = placeIdArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
}

