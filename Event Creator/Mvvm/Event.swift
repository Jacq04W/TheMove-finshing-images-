//
//  Location.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/13/23.
//

import Foundation
//import FirebaseFirestoreSwift
import Foundation
import MapKit

// the details each location should have
// this struct will be used for creating events so if we need to add more varibales on it to define it more thats fine 
struct Event: Identifiable, Equatable{
     var id: String?
    var name: String
    var category: String
    var TType: String
    var location: String
    var price: Int?
    var description: String
    var startDate: String?
    var startTime: String?
    var endTime: String?
    var organizerName: String
    var phoneNumber: String
    var images: [String]
    var coordinates: CLLocationCoordinate2D
    var link : String
    var tickets = [Ticket]()

    struct PartyPageDetails: Identifiable{
      var id : String?
        var coordinates: String
        var link: String
        var tickets = [Ticket]()
    }
    
    // maybe change this to a class and let the tickerts inherete data from the  location/Event
    // and reuse that data to make tickets
    
    // or nest Tickets inside of here so we are specifying each ticket is an event
    
    
    // this is for Equabtle
    // if two locations have the sasme id we set them equal to eachother
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.id == rhs.id    }
    
}

enum CodingKeys: String, CodingKey {
    case PartyPageDetails
    
    
    
}
