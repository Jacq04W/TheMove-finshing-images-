//
//  TicketsViewModel.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/13/23.
//

import Foundation
import SwiftUI
import CoreLocation
class TicketsViewModel : ObservableObject {
    @Published private(set) var tickets: [Ticket] = []
    @Published private(set) var total: Int = 0

    @Published var seeEvents: Bool = false

    // have tickets available  amount,, that user sets
    
    //make an instance of ticket everytime saomsbody creats of tickets
    // builds the ticket based on user input
    // whenerver someone buys a ticket take away from total availabale
        // if they cancel ticket it adds it back
    // so its one source for the creaor to see how many tickets is made e
    
    
    
    func addToCart(_ ticket : Ticket){
        tickets.append(ticket)
        total += ticket.price
    }
    
    func removeFromCart(_ ticket:Ticket) {
        tickets = tickets.filter{ $0.id != ticket.id }
        total -= ticket.price
    }
    
    
    func NumberOfTickets(_ num : Int){
        
        
        
    }

    
      var ticketsA = [
        Ticket(id: 1, price: 20, type: "GA", quantity: 30, eventt: EventsDataService.events.first!)
 ]
    
    
    
    var eventt = [
    Event(name: "AAron", category: "GA", TType: "ga", location: "", description: "", organizerName: "", phoneNumber: "",
        images: [
        "shake1",
        "shake2",
        "shake3"
    ], coordinates: CLLocationCoordinate2D(latitude: 42.476954474929244, longitude: -83.14910857471085), link: "")
    
    ]
}
