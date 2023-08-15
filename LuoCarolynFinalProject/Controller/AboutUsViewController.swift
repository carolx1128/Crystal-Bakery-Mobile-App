//
//  AboutUsViewController.swift
//  LuoCarolynFinalProject
//
//  Created by Carolyn Luo on 4/29/23.
//

import UIKit
import MapKit
import CoreLocation

class AboutUsViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var goButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Utilities.styleFilledButton(goButton, 1)
        addressTextField.becomeFirstResponder()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.delegate = self
        mapView.showsUserLocation = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // start navigating when the go button is clicked
    @IBAction func goTapped(_ sender: UIButton) {
        getAddress()
    }
    
    // search the address in the text field
    func getAddress () {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(addressTextField.text!) { (placemarks, error) in
            guard let placemarks = placemarks, let location =
                    placemarks.first?.location
            else {
                print("No location found")
                return
            }
            print(location)
            self.mapThis(destinationCoord: location.coordinate)
        }
    }
    
    // print location to the console
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
    
    // get the directions from source to destination
    func mapThis(destinationCoord : CLLocationCoordinate2D) {
        let sourceCoord = locationManager.location?.coordinate
        let sourcePlaceMark = MKPlacemark(coordinate: sourceCoord!)
        let destPlaceMark = MKPlacemark(coordinate: destinationCoord)
        
        let sourceItem = MKMapItem(placemark: sourcePlaceMark)
        let destItem = MKMapItem(placemark: destPlaceMark)
        
        let destinationRequest = MKDirections.Request()
        destinationRequest.source = sourceItem
        destinationRequest.destination = destItem
        destinationRequest.transportType = .automobile
        destinationRequest.requestsAlternateRoutes = true
        
        let directions = MKDirections(request: destinationRequest)
        directions.calculate{ (response, error) in
            guard let response = response else {
                if let error = error {
                    print("\(error)")
                }
                return
            }
            let route = response.routes[0]
            // Remove previous route overlay
            if let overlays = self.mapView.overlays as? [MKPolyline] {
                for overlay in overlays {
                    self.mapView.removeOverlay(overlay)
                }
            }
            self.mapView.addOverlay(route.polyline)
            self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
        }
    }
    
    // draw out the lines of the direction to get to the store
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        render.strokeColor = .blue
        return render
    }
    
    // stop updating location when exiting the page
    override func viewDidDisappear(_ animated: Bool) {
        self.locationManager.stopUpdatingLocation()
    }
}
