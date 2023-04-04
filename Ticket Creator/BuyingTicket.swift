//
//  BuyingTicket.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/17/23.
//

import SwiftUI

struct BuyingTicket: View {
    @StateObject var ticketVm = TicketsViewModel()
    let columns = [GridItem(.adaptive(minimum: 160),spacing: 20)]
    var body: some View { 
       NavigationView {
            ScrollView{
                
                // need to update ui here
                // need to fix when you delete something it should delete one item at a time
                // creates ui for home page
                LazyVGrid(columns: columns,spacing: 20) {
                    ForEach(tickets, id: \.id){ Ticket in
                           // this should hold data from server ↓
                        OfficialTicket(event: ticketVm.eventt[0], ticket: Ticket)
                            .environmentObject(ticketVm)
                    }
                } 
                .padding()
            }
            .navigationTitle(Text("Cop a Ticket "))
    .toolbar{
        // puts a cart button in top right corner
        NavigationLink{
            MyTickets()
                .environmentObject(ticketVm)
        } label: {
            CartButton(numberOfProducts: ticketVm.tickets.count)
                .foregroundColor(Color(hue: 0.566, saturation: 0.965, brightness: 0.795))
        }

            }
        }    }
}

struct BuyingTicket_Previews: PreviewProvider {
    static var previews: some View {
        BuyingTicket()
            
    }
}
