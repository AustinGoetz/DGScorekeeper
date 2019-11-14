//
//  CourseSearchViewController.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/13/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit
import MapKit

class CourseSearchViewController: UIViewController, UISearchBarDelegate {

    // MARK: - Outlets
    @IBOutlet weak var courseSearchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    
    
    var courses: [Courses] = [] {
        didSet {
            DispatchQueue.main.async {
                self.loadViewIfNeeded()
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseSearchBar.delegate = self
        mapView.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchValue = searchBar.text, !searchText.isEmpty else { return }
        
        CourseController.fetchYeplBusiness(searchTerm: searchValue) { courses in
            self.courses = courses
        }
    }
}

extension CourseSearchViewController: MKMapViewDelegate {
    
    // 1: gets called for every annotation you add to the map
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2: check that the annotation is an Artwork object (could be something like the user location) and if it is, not return nil
        guard let annotation = annotation as? TopLevelDict else { return nil }
        
        // 3: to make markers appear, you crate each view as an MKMarkerAnnotationView
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        // 4: checks to see if a reusable annotation view is available before creating a new one
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Courses
        
        let launcOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
}
