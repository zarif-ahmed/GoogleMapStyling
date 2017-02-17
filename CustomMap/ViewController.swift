//
//  ViewController.swift
//  CustomMap
//
//  Created by Zarif Ahmed on 2/7/17.
//  Copyright © 2017 Zarif Ahmed. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        

        self.view = mapView
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

