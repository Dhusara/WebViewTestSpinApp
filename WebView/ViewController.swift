//
//  ViewController.swift
//  WebView
//
//  Created by Serhii Demianenko on 10.09.2020.
//  Copyright © 2020 Serhii Demianenko. All rights reserved.
//

import UIKit
import WebKit
import CoreLocation
import FBSDKLoginKit

class ViewController: UIViewController {
    
    let coordinateManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        betButton.isHidden = true
        coordinateManager.delegate = self
        coordinateManager.requestWhenInUseAuthorization()
        coordinateManager.desiredAccuracy = kCLLocationAccuracyKilometer
        
        checkLocationManager(coordinateManager, didUpdateLocations: locations)
        
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
        loginButton.permissions = ["public_profile", "email"]
        
    }
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var betButton: UIButton!
    @IBOutlet var spin: UIButton!
    
    // MARK: Coordinates of Sillicon Valley to reject moderator entry (example)
    let latitude = 37.4526
    let longitude = 122.1811

        
    func checkLocationManager(_ manager: CLLocationManager, didUpdateLocations locations: [AnyObject]) {
        guard let _: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
    }
    
    let locations = [CLLocation]()
    
    @IBAction func spinButtonTouched(_ sender: Any) {
//        print(coordinateManager.location?.coordinate.latitude ?? "Error")
//        print(coordinateManager.location?.coordinate.longitude ?? "Error")
        
        if coordinateManager.location?.coordinate.latitude == latitude && coordinateManager.location?.coordinate.longitude == longitude {
            print("Error")
        } else {
            betButton.isHidden = false
        }
        
    }
    
    @IBAction func betButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "segueToWeb", sender: UIButton())
    }
}

extension ViewController: CLLocationManagerDelegate {

    public func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
