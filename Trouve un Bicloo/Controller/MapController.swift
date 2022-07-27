//
//  Map.swift
//  Trouve un Bicloo
//
//  Created by kevin jan on 21/07/2022.
//

import UIKit
import MapKit


class MapController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var segmented: UISegmentedControl!
    
    var manager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        //manager.startUpdatingLocation()
        map.userTrackingMode = .followWithHeading
        map.showsUserLocation = true
        map.delegate = self
        
        BicloopService().getStations { [weak self] stations in
            self?.showStationsOnMap(stations: stations)
        }
        
        
    }
    
    private func showStationsOnMap(stations: [Station]) {
        for station in stations {
            let annotation = MKPointAnnotation()
            annotation.title = station.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: station.position.latitude, longitude: station.position.longitude)
            map.addAnnotation(annotation)
            print(station.position)
        }
    }
    
    func setRegion(_ coordinates: CLLocationCoordinate2D) {
        
        let center = coordinates
        let degrees = 0.1
        let span = MKCoordinateSpan(latitudeDelta: degrees, longitudeDelta: degrees)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: center, span: span)
        map.setRegion(region, animated: true)
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: map.mapType = .standard
        case 1: map.mapType = .satellite
        case 2: map.mapType = .hybrid
        default: break
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Selection")
    }
}

extension MapController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways: print("Toujours")
        case .authorizedWhenInUse: print("Quand l'application est ouverte")
        case .denied: print("Refuser")
        case .notDetermined: print("je ne sais pas")
        case .restricted: print("Restrictions")
        default: print("On ne connais pas ce cas")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        let coordinates = location.coordinate
        setRegion(coordinates)
    }
    
}
            
 
