//
//  Marcador.swift
//  MapKit en IOS
//
//  Created by alumno on 4/04/17.
//  Copyright © 2017 william. All rights reserved.
//

import UIKit
import MapKit

class Marcador: NSObject, MKAnnotation {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var subtitle: String?
    
    init(title:String, coordinate:CLLocationCoordinate2D, subtitle:String) {
        self.title = title
        self.coordinate = coordinate
        self.subtitle = subtitle
        
        super.init()
    }
    
    /*var title:String?{
        return nombre
    }*/
    

}
