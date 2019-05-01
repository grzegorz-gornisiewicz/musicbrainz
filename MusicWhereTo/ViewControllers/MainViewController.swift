//
//  MainViewController.swift
//  MusicWhereTo
//
//  Created by Grzegorz Górnisiewicz on 39.04.2019.
//  Copyright © 2019 Long Road. All rights reserved.
//

import UIKit
import MapKit

class MainViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet var mapView: MKMapView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var countOfRecords = 0
    var addedAnotations = 0
    var searchTerm = ""

    let req = PlacesRequest()
    lazy var searchBar = UISearchBar(frame: CGRect.zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.placeholder = "Search term"
        searchBar.delegate = self
    
        navigationItem.titleView = searchBar

        infoLabel.text = "No places on map"
    }
    
    func updateInfo(_ text: String) {
        infoLabel.text = text
    }

    func processPlace(_ place: Place) {
        guard let lat = place.coordinates?.latitude?.doubleValue
            , let lng = place.coordinates?.longitude?.doubleValue
            , let year = place.lifespan?.begin?.integerValue
            else { return }
        
        let annotation = MKPointAnnotation()
        if lat != 0.0 && lng != 0.0 && year >= 1990 {
            annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
            annotation.title = place.name
            
            mapView.addAnnotation(annotation)
            updateInfo("\(self.mapView.annotations.count) place(s) on map")
            
            let lifespan = 1.0 * Double(year - 1990)
            print("year:\(year), ttl:\(lifespan)")
            
            annotation.setLifespan(lifespan) {
                self.mapView.removeAnnotation(annotation)
                if self.mapView.annotations.count > 0 {
                    self.updateInfo("\(self.mapView.annotations.count) place(s) on map")
                } else {
                    self.updateInfo("No places on map")
                }
            }
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchTerm = searchBar.text!
        if self.mapView.annotations.count == 0 {
            updateInfo("Searching for \(searchTerm)")
        }

        req.find(searchTerm) { (places, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                for place in places {
                    self.processPlace(place)
                }
                
                self.mapView.showAnnotations(self.mapView.annotations, animated: true)
                
                if self.mapView.annotations.count == 0 {
                    self.updateInfo("No places on map")
                }
            }
        }
    }
}

