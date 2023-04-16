//
//  ViewModel.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/13/23.
//

import CoreLocation
import FirebaseCore
import FirebaseFirestore
import FirebaseDatabase
import MapKit
import SwiftUI
import FirebaseStorage

// Equatable means if the
class EventsViewModel : ObservableObject{
    /// all the locations ↓
    @Published var events:[Event]
    var locationInfo: CLLocation? = nil

    ///for user to input info on form
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var addressString: String = ""
    @Published var date = Date()
    @Published var showSheet: Bool = false
    @Published var newCoordinates: [Double] = []
    
    let defaultEvent = Event(images: [], address: "660 Woodward", coordinates: CLLocationCoordinate2D(), holdCoords: [], date: Date())
    /// current location on map ↓
    @Published var mapLocation: Event {
/// everytime the map location is set update the map region so they match ↓
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
        self.mapLocation = events.first ?? defaultEvent
        
        // starts our map view off with the lo of the first thing in the array ↓
        self.updateMapRegion(events.first ?? defaultEvent)
        fetchdata()
        geocode()
        
        let cl = CLLocationCoordinate2D(latitude: locationInfo?.coordinate.latitude ?? 0.00, longitude: locationInfo?.coordinate.longitude ?? 0.00 )
//
        self.mapRegion = MKCoordinateRegion (center: CLLocationCoordinate2D(latitude: 42.33121309568572, longitude: -83.04603806574511), span:  MKCoordinateSpan(latitudeDelta:0.05, longitudeDelta:0.05))

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



extension EventsViewModel{

    
    func fetchdata(){
        let db = Firestore.firestore()
        let ref = db.collection("Event")
        ref.getDocuments { [self] snapshot, error in
            guard error == nil else {
                print (error! .localizedDescription)
                print("cant get snapshot")
                return }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data ()
                    let name = data["name"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let address = data["address"] as? String ?? ""
                    let coordinates = data["holdCoords"] as? [Double] ?? [0.00,0.00]
                    if let createdAt = data["date"] as? Timestamp  {
                        let newDate = createdAt.dateValue()
                        print("Created at: \(date)")
                    }

                    
            // need core location coordintes from fire base
             // this is the data from FireB we will be appending to our main array ↓
                    let event = Event(name: name, category: "", TType: "", location: "", description: description, organizerName: "", phoneNumber: "", images: [""], address: address, coordinates: CLLocationCoordinate2D(latitude: coordinates[0], longitude: coordinates[1]), holdCoords: coordinates, date: date, link: "")
                    
                    DispatchQueue.main.async{
                        events.append(event)
                    }
                }
                // appends to the big array
                    self.events = events
                
            }
        }
    }
    
    
    
    
    func addEvent(){
        addEvent(newName: name, newDescription: description, date: date)
    }

    func addEvent(newName: String,newDescription: String,date:Date){
        let db = Firestore.firestore()
        let ref = db.collection("Event").document(newName)
        let timestamp = Int(date.timeIntervalSince1970)
         ref.setData([ "name": newName
                      ,"description": newDescription,
                      "address": addressString,
                       "holdCoords": newCoordinates,
                       "date" : timestamp
                     ]){ error in
             if let error = error {
                print (error.localizedDescription)
                print("cant add new data")}}}
    
    
    
    
    
    // new code
    func geocode(){
        geocode(from: addressString)
        
    }
    func geocode(from addressString: String) {
            let geocoder = CLGeocoder()
                       // decode info from here
        geocoder.geocodeAddressString(addressString) { [self] placemarks, error in
        // place mark is the decoded info from whatever we search
                guard let placemark = placemarks?.first, error == nil else {
                    print("Error geocoding address: \(error?.localizedDescription ?? "unknown error")")
                    return
                }
                
            // put the coords into their own var
            self.locationInfo = placemark.location
            let lat = locationInfo?.coordinate.latitude ?? 0.00
            let lon = locationInfo?.coordinate.longitude ?? 0.00
            
 
             // Send coords to firebase
            let db = Firestore.firestore()
            newCoordinates.append(lat)
            newCoordinates.append(lon)
            print("item in new coordinate \(newCoordinates.count)")
            self.newCoordinates = [lat,lon]
            var coordinatesDict = [String: Double]()
            for (index, coords) in newCoordinates.enumerated() {
                coordinatesDict[String(index)] = coords
            }
            
            // Sending rest of event info to FB
            func addEvent(newName: String,newDescription: String,date:Date){
                let db = Firestore.firestore()
                let ref = db.collection("Event").document(newName)
                let timestamp = Int(date.timeIntervalSince1970)
                 ref.setData([ "name": newName
                              ,"description": newDescription,
                              "address": addressString,
                               "holdCoords": newCoordinates,
                               "date" : timestamp
                             ]){ error in
                     if let error = error {
                        print (error.localizedDescription)
                        print("cant add new data")}}}
            func addEvent(){
                addEvent(newName: name, newDescription: description, date: date)
            }
            //
            
            DispatchQueue.main.async { [self] in
                let newLocation = Event(name: self.name, category: "", TType: "", location: "", description:"", organizerName: "", phoneNumber: "", images: [""], address:addressString, coordinates: CLLocationCoordinate2D(latitude: newCoordinates[0], longitude: newCoordinates[1]), holdCoords: newCoordinates, date: date, link: "")
                
    
                self.events.append(newLocation)
                self.mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: newLocation.coordinates.latitude, longitude: newLocation.coordinates.longitude), span: mapSpan)
                print("adding new location to array \(events)")
                addEvent()
            }
            }
        }
    
    // new code
    func refreshdata(){
         events.removeAll()
         let db = Firestore.firestore()
         let ref = db.collection("Event")
        
         ref.getDocuments { snapshot, error in
             guard error == nil else {
                 print (error! .localizedDescription)
                 print("cant get snapshot")
                 return }
             if let snapshot = snapshot {
                 for document in snapshot.documents {
                     let data = document.data ()
                     let name = data["name"] as? String ?? ""
                     let description = data["description"] as? String ?? ""
                     let address = data["address"] as? String ?? ""
                     let coordinates = data["holdCoords"] as? [Double] ?? [0.00]
                     if let createdAt = data["date"] as? Timestamp  {
                         let date = createdAt.dateValue()
                         print("Created at: \(date)")
                     }

                     let lat = self.locationInfo?.coordinate.latitude ?? 0.00
                     let lon = self.locationInfo?.coordinate.longitude ?? 0.00

                     
                 // need core location coordintes from fire base
                     let event =
                     Event(images: [""], address: "", coordinates: CLLocationCoordinate2D(latitude: lat, longitude: lon), holdCoords: self.newCoordinates, date: Date())
                     
//
//                     Store(name: name, coordinates: CLLocationCoordinate2D(latitude:lat, longitude: lon), holdCoords: self.newCoordinates, date: self.date)
//
                     self.events.append(event)
                     
                 }
             }
         }
     }
    
    
    
}//extension
