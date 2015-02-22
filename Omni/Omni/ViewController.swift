//
//  ViewController.swift
//  Omni
//
//  Created by Su Min on 2/22/15.
//
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    // Your name:
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var user_name_text: UITextField!
    var name = ""
    
    //Emergency Contact Name
    @IBOutlet weak var contact_name_label: UILabel!
    @IBOutlet weak var contact_name_label_text: UITextField!
    var contact_name = ""
    
    //Emergency Contact Phone #
    @IBOutlet weak var contact_phone_label: UILabel!
    @IBOutlet weak var contact_phone_text: UITextField!
    var contact_phone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: {(placemarks, error) -> Void in
            
            if (error != nil){
                println("Error:" + error.localizedDescription)
                return
            }
            
            if placemarks.count > 0 {
                let pm = placemarks[0] as CLPlacemark
                self.displayLocationInfo(pm)
            } else {
                println("Error with data")
            }
            
        })
    }
    
    func displayLocationInfo(placemark: CLPlacemark) {
        self.locationManager.stopUpdatingLocation()
        println(placemark.locality)
        println(placemark.postalCode)
        println(placemark.administrativeArea)
        println(placemark.country)
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error: " + error.localizedDescription)
    }
    
    //Submit button
    @IBAction func submit(sender: AnyObject) {
        name = user_name_text.text
        contact_name = contact_name_label_text.text
        contact_phone = contact_phone_text.text
        println(name)
        println(contact_name)
        println(contact_phone)
    }
    
    
}






