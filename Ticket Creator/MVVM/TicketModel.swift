//
//  TicketInfo.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/10/23.
//
import Foundation
import CoreLocation

//struct User: Identifiable,Codable {
//    var id = UUID()
//    let name: String
//    let age: Int
//    let address: Address? // each event should have this
//    let event: [Event]?
//}


struct Ticket : Identifiable {
// each ticket is also going to need a location, mapKit
    var id : Int
    var price: Int
    let type : String
    let quantity:Int
    let eventt:Event
}
 

//struct Event{
//    var tickets = [Ticket]
//}

struct Address:Codable{
    let street, zip, city: String
}


// premade tickets we can put on display so we can buy
//

var tickets: [Ticket] =
[
    Ticket(id: 1, price: 20, type: "Ga", quantity: 50, eventt: EventsDataService.events[0]),
    Ticket(id: 2, price: 90, type: "Vip", quantity: 100, eventt: EventsDataService.events[0])
]


