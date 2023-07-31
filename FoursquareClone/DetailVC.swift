//
//  DetailVC.swift
//  FoursquareClone
//
//  Created by Ali Berkay BERBER on 10.06.2023.
//

import UIKit
import MapKit
import Parse
class DetailVC: UIViewController {

    
    @IBOutlet weak var detailsImageView: UIImageView!
    
    @IBOutlet weak var placeNameLabel: UILabel!
    
    @IBOutlet weak var placeTypeLabel: UILabel!
    
    @IBOutlet weak var placeAtmospherLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var chosenPlaceId = ""
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       getData()
       
   
        print(chosenLongitude)
    }
    
    func makeAlert(titleInput: String, massageInput: String) {
       let alert = UIAlertController(title: titleInput, message: massageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert,animated: true)
    }
    
    func getData() {
        let query = PFQuery(className: "Places")
        query.whereKey("objectId", equalTo: chosenPlaceId)
        query.findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(titleInput: "Error", massageInput: error?.localizedDescription ?? "Error")
            }else {
                if objects != nil{
                    if objects!.count > 0 {
                        let chosenPlaceObject = objects![0]
                        
                        
                        //MARK: -- objects
                        
                        if let placeName = chosenPlaceObject.object(forKey: "name") as? String {
                            self.placeNameLabel.text = placeName
                        }
                        if let placeType = chosenPlaceObject.object(forKey: "type") as? String {
                            self.placeTypeLabel.text = placeType
                        }
                        if let placeAtmosphere = chosenPlaceObject.object(forKey: "atmosphere") as? String {
                            self.placeAtmospherLabel.text = placeAtmosphere
                        }
                        
                        if let placeLatitude = chosenPlaceObject.object(forKey: "latitude") as? String {
                            if let placeLatitudeDouble = Double(placeLatitude) {
                                self.chosenLatitude = placeLatitudeDouble
                            }
                        }
                        if let placeLongitude = chosenPlaceObject.object(forKey: "longitude") as? String {
                            if let placeLongitudeDounle = Double(placeLongitude) {
                                self.chosenLongitude = placeLongitudeDounle
                            }
                        }
                        
                        if let imageData = chosenPlaceObject.object(forKey: "image") as? PFFileObject {
                            imageData.getDataInBackground { data, error in
                                if error != nil {
                                    self.makeAlert(titleInput: "Error", massageInput: error?.localizedDescription ?? "Error")
                                }else {
                                    self.detailsImageView.image = UIImage(data: data!)
                                }
                            }
                        }
                        
                        // MARK: -- maps
                        
                        let location = CLLocationCoordinate2D(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
                        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                        let region = MKCoordinateRegion(center: location, span: span)
                        self.mapView.setRegion(region, animated: true)
                        
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = location
                        annotation.title = self.placeNameLabel.text
                        annotation.subtitle = self.placeTypeLabel.text
                        self.mapView.addAnnotation(annotation)
                        
                    }
                    
                }
            }
        }
    }
    
}
