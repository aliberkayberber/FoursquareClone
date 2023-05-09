//
//  AddPlaceVC.swift
//  FoursquareClone
//
//  Created by Ali Berkay BERBER on 9.05.2023.
//

import UIKit

class AddPlaceVC: UIViewController {
    
    @IBOutlet weak var placeNameText: UITextField!
    
    @IBOutlet weak var placeTypeText: UITextField!
    
    @IBOutlet weak var placeAtmosphoreText: UITextField!
    
    
    
    @IBOutlet weak var placeImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func NextButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toMapVC", sender: nil)
    }
    

}
