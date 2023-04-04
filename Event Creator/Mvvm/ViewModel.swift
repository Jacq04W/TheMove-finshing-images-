//
//  ViewModel.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/13/23.
//

import Foundation

import MapKit
import SwiftUI
// Equatable means if the
class EventsViewModel : ObservableObject{
    // all the locations ↓
    @Published var events:[Event] = []
    
    // current location on map ↓
    @Published var mapLocation: Event {
// everytime the map location is set update the map region so they match ↓
        didSet {
            updateMapRegion(mapLocation)
        }
    }
    
 // setting the region to empty
    // we eventually wanna set this to whatever city the user chooses
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
// sets how close the map is to screen whenever its open
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    // show list of location
   @Published var showLocationsList: Bool = false
    @Published var changeCityLocation: Bool = false

    @Published var sheetLocations: Event? = nil
 
    
    init(){
        let events = EventsDataService.events
        self.events = events
        
        // set this to the first lo in the array ↓
        // only force unwrap this beacause we know for a fact there is always soemthing in our array
        self.mapLocation = events.first!
        
        // starts our map view off with the lo of the first thing in the array ↓
        self.updateMapRegion(events.first!)
    }
    
    
    
    
// this will update the map region to whatever location is pressed ↓
    func updateMapRegion(_ event : Event){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: event.coordinates,
                span: mapSpan)
        }
    }
    
    // this will make the list appear when a buttn is pressed ↓
     func toggleLocationsList(){
        withAnimation(.easeInOut){
            showLocationsList.toggle()
        }
        
    }
    
        // this function is for our list row
    // it will change the map location to whichever one of the cards is pressed
    func showNextEvent(_ event: Event){
        withAnimation(.easeInOut){
            mapLocation = event
            changeCityLocation.toggle()
// this will close the list row ↑
        }
    }
    
     
    
    func nextButtonPressed() {
        // seeing what the first item in the aaray is
       
        // check the current index
        guard let currentIndex = events.firstIndex(where: {$0 == mapLocation}) else {
            return
        }
        
        //check if next index is valid item
        let nextIndex = currentIndex + 1
        guard events.indices.contains(nextIndex) else {
            guard let firstEvent = events.first else { return }
            showNextEvent(firstEvent)
               return
        }
        
        //next indesx is valid
        let nextEvent = events [nextIndex]
        showNextEvent(nextEvent)
        
        
        
    }
    
    
    
    
}
