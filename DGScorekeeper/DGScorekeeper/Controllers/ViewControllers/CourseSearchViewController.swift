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

    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    
    var courses: [Courses] = [] {
        didSet {
            DispatchQueue.main.async {
                self.loadViewIfNeeded()
                
            }
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var courseSearchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseSearchBar.delegate = self
        checkLocationServices()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUsersLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // Action to handle error
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            
            mapView.showsUserLocation = true
            centerViewOnUsersLocation()
            locationManager.startUpdatingLocation()
            
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        case .authorizedAlways:
            break
        @unknown default:
            fatalError()
        }
    }
}

extension CourseSearchViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}
    
    
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        guard let searchValue = searchBar.text, !searchText.isEmpty else { return }
//
//        CourseController.fetchYelpBusiness(searchTerm: searchValue, location: nil, latitude: 45.5051, longitude: -122.6750) { courses in
//            self.courses = courses
//        }
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//
//        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
//        CourseController.fetchYelpBusiness(searchTerm: searchText, location: nil, latitude: locationManager.location?.coordinate.latitude, longitude: locationManager.location?.coordinate.longitude) { (results) in
//            DispatchQueue.main.async {
//                self.fetchBusinessAnnotation(businesses: results)
//            }
//        }
//    }

//extension CourseSearchViewController: MKMapViewDelegate {
//
//    // 1: gets called for every annotation you add to the map
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        // 2: check that the annotation is an Artwork object (could be something like the user location) and if it is, not return nil
//        guard let annotation = annotation as? TopLevelDict else { return nil }
//
//        // 3: to make markers appear, you crate each view as an MKMarkerAnnotationView
//        let identifier = "marker"
//        var view: MKMarkerAnnotationView
//
//        // 4: checks to see if a reusable annotation view is available before creating a new one
//        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
//            dequeuedView.annotation = annotation
//            view = dequeuedView
//        } else {
//
//            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            view.canShowCallout = true
//            view.calloutOffset = CGPoint(x: -5, y: 5)
//            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//        }
//        return view
//    }
//
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        let location = view.annotation as! Courses
//
//        let launcOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
//        location.mapItem().openInMaps(launchOptions: launchOptions)
//    }
//}
