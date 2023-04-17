//
//  CityModel.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 4/17/23.
//


import Foundation
import MapKit

struct City: Identifiable {
    var id: String {
        cityName +  stateName
    }
    var cityName : String
    var stateName: String
    var coordinates: CLLocationCoordinate2D
    let imageNames: [String]

}
