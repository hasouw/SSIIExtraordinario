//
//  VCTabla.swift
//  FinalExtraordinario
//
//  Created by Daniel Chantres Palacios on 28/6/18.
//  Copyright © 2018 Daniel Chantres Palacios. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase

class VCTabla: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tbMiTabla:UITableView?    
    @IBOutlet var MiMapa:MKMapView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        refHandle = DataHolder.sharedInstance.firDataBaseRef.child("Coches").observe(DataEventType.value, with: { (snapshot) in
            var arTemp = snapshot.value as? Array<AnyObject>
            
            if(DataHolder.sharedInstance.arCoches==nil){
                DataHolder.sharedInstance.arCoches=Array<Coche>()
            }
            for co in arTemp! as [AnyObject]{
                let cochei=Coche(valore: co as! [String:AnyObject])
                DataHolder.sharedInstance.arCoches?.append(cochei)
            }
            
            self.tbMiTabla?.reloadData()
            
        })
        
        MiMapa?.showsUserLocation = true
        
        DataHolder.sharedInstance.locationAdmin?.delegate=self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(DataHolder.sharedInstance.arCoches==nil){
            return 0
        }else{
            return (DataHolder.sharedInstance.arCoches?.count)!
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCMicelda = tableView.dequeueReusableCell(withIdentifier: "micelda1") as! TVCMiCelda
        
        let cochei:Coche=DataHolder.sharedInstance.arCoches![indexPath.row]
        cell.lblMarca?.text=cochei.sMarca
        cell.lblModelo?.text=cochei.sModelo
        cell.lblTipo?.text=cochei.sTipo
    }
    
    func centralizarEnPosicion(coordenada:CLLocationCoordinate2D)  {
        let region:MKCoordinateRegion=MKCoordinateRegion( center:coordenada,span:MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        MiMapa?.setRegion(region, animated: true)
    }
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        centralizarEnPosicion(coordenada: userLocation.coordinate)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
