//
//  CityData.swift
//  TheMove
//
//  Created by Jacquese Whitsonµ  on 3/13/23.
//

import Foundation
import MapKit

class CityDataService {
static let cities : [City] =
    
    [
     
        City(cityName: "Detroit", stateName: ",Mi", coordinates: CLLocationCoordinate2D(
           latitude: 40.67678699246087,
           longitude: -73.94703949400598), imageNames: ["det"]),
        
        
        City(cityName: "Atlanta", stateName: ",Ga", coordinates: CLLocationCoordinate2D(
latitude: 33.75580547539381,
longitude: -84.38941415701477),
imageNames: [ "atl"]),
        
        
        City(cityName: "Fort Lauderdale", stateName: ",Fl", coordinates: CLLocationCoordinate2D(
latitude: 26.121479539301493,
longitude: -80.14105016826329),
imageNames: [ "fl"]),
        
        
        City(cityName: "New York", stateName: ",Ny", coordinates: CLLocationCoordinate2D(
latitude: 40.67678699246087,
longitude: -73.94703949400598),
             imageNames: ["ny"])
        ,
        City(cityName: "St.Louis", stateName: ",Mo", coordinates: CLLocationCoordinate2D(
            latitude: 40.67678699246087,
            longitude: -73.94703949400598), imageNames: ["miz"])
        
            
    
    
    ]
    
}
