//
//  PlacesViewController.swift
//  FoursquareClone
//
//  Created by Ali Berkay BERBER on 20.03.2023.
//

import UIKit

class PlacesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
    }
    
    @objc func addButtonClicked() {
        // segue
    }
}
