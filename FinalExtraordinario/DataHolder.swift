//
//  DataHolder.swift
//  FinalExtraordinario
//
//  Created by Daniel Chantres Palacios on 28/6/18.
//  Copyright © 2018 Daniel Chantres Palacios. All rights reserved.
//

import UIKit

class DataHolder: NSObject {
    static let sharedInstance:DataHolder=DataHolder()
    
    var numeroCeldasColeccion:UInt=20;
    var locationAdmin:LocationAdmin?
    
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
    
    
    func initFireBase(){
        FIRApp.configure()
    }

}
