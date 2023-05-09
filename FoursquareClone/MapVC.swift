//
//  MapVC.swift
//  FoursquareClone
//
//  Created by Ali Berkay BERBER on 9.05.2023.
//

import UIKit
import MapKit
class MapVC: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(mapSave))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backClicked))
    }
    
    @objc func mapSave() {
        
    }
    
    @objc func backClicked() {
        self.dismiss(animated: true)
    }
}
