//
//  PlaceModel.swift
//  FoursquareClone
//
//  Created by Ali Berkay BERBER on 10.06.2023.
//

import Foundation
import UIKit

class PlaceModel {
    
    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeAtmposphere = ""
    var placeImage = UIImage()
    
    private init() {
        
    }
}
