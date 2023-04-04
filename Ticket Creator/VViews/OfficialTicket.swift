//
//  TicketListView.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/16/23.
//

import SwiftUI

struct OfficialTicket: View {
    @EnvironmentObject private var ticketVm: TicketsViewModel
    @EnvironmentObject private var eventsVm: EventsViewModel

    var event: Event
    var ticket : Ticket
    var body: some View {
        ZStack(alignment: .topTrailing){
            ZStack(alignment: .bottom){
                Image(event.images[0])
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                
                VStack(alignment: .leading){
                    Text(event.name)
                        .bold()
                Text("\(ticket.price)$")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
            }
            .frame(width: 180,height: 250)
        .shadow(radius: 3)
            // created the lil plus button in top of corner
            Button(){
                ticketVm.addToCart(ticket)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
        }
        
    }
}

struct TicketListView_Previews: PreviewProvider {
    static var previews: some View {
        OfficialTicket(event: EventsDataService.events.first!, ticket:tickets[0])
            .environmentObject(TicketsViewModel())

    }
}
