//
//  LocationAdmin.swift
//  FinalExtraordinario
//
//  Created by Daniel Chantres Palacios on 28/6/18.
//  Copyright © 2018 Daniel Chantres Palacios. All rights reserved.
//

import UIKit
import CoreLocation

class LocationAdmin: NSObject, CLLocationManagerDelegate {
    var locationManager:CLLocationManager?
    var delegate:LocationAdminDelegate?
    override init() {
    super.init()
    
    locationManager=CLLocationManager()
    locationManager?.delegate=self
    locationManager?.requestAlwaysAuthorization()
    locationManager?.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    print("Mi posicion en Latitud: ", locations[0].coordinate.latitude, " Longitud: ", locations[0].coordinate.longitude)
    delegate?.localizacionActualizada(coordenada: locations[0].coordinate)
    }
    }
    protocol LocationAdminDelegate {
        func localizacionActualizada(coordenada:CLLocationCoordinate2D)
}
