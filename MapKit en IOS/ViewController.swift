//
//  ViewController.swift
//  MapKit en IOS
//
//  Created by alumno on 4/04/17.
//  Copyright © 2017 william. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    //-12.102616, -77.025891
    let location = CLLocation(latitude: -12.102616, longitude: -77.025891)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        centrar(ubicacion: location)
        
        let marcador = Marcador(title: "Marcador 1", coordinate: location.coordinate, subtitle:"subtitle")
        
        mapView.addAnnotation(marcador)
        
    }
    
    func centrar(ubicacion: CLLocation) {
        let region = MKCoordinateRegion(center: ubicacion.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        
        mapView.setRegion(region, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func segMapa(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = MKMapType.standard
        case 1:
            mapView.mapType = MKMapType.satellite
        default:
            mapView.mapType = MKMapType.hybrid
        }
        
        mapView.isRotateEnabled = true
    }
    
    //Metodos de MapViewDelegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "marcador"
        var view: MKAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier){
            dequeuedView.annotation = annotation
            view = dequeuedView as! MKPinAnnotationView
        }else{
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView!
            view.detailCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView!
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: 0, y: -10)
            
            //view.image = UIImage(named: <#T##String#>)
            
            //let vista = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            //vista.backgroundColor = UIColor.red
            //view.detailCalloutAccessoryView = vista

        }
        return view
    }
    

}

