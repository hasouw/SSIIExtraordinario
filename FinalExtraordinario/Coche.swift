//
//  Coche.swift
//  FinalExtraordinario
//
//  Created by Daniel Chantres Palacios on 28/6/18.
//  Copyright © 2018 Daniel Chantres Palacios. All rights reserved.
//

import UIKit

class Coche: NSObject {
    var sMarca:String?
    var sModelo:String?
    var sTipo:String?
    
    init (valores:[String:AnyObject]){
        sMarca=valores["Marca"] as? String
        sModelo=valores["Modelo"] as? String
        sTipo=valores["Tipo"] as? String
    }

}
