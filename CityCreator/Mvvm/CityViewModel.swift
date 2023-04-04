//
//  CityViewModel.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/13/23.
//

import Foundation
import SwiftUI
import MapKit

class CitiesViewModel : EventsViewModel {
    @Published var cities : [City]
   @Published var newMapLocation: City {
   didSet {
        updateMapRegion( mapLocation)
       }
   }// end mapLo
    @State var currentLocation = false

    
    
    
    
    override init() {
       let cities = CityDataService.cities
       self.cities = cities
       self.newMapLocation = cities.first!
       super.init()
   }
    
   func cityNextLocation(location: City){
      withAnimation(.easeInOut){
          changeCityLocation.toggle()
//// this will close the list row ↑
       }
   }
    
    func showCurrentLocation(){
        currentLocation.toggle()
    }
    
    
    }// end class

    
    
    
    
    
    
    

