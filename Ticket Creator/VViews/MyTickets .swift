//
//  MyTickets .swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/16/23.
//

import SwiftUI
import CoreLocation

struct MyTickets: View {
    @EnvironmentObject private var ticketVm: TicketsViewModel
    var body: some View {
            VStack {
                    
    if ticketVm.tickets.count > 0  {
                             
                List {
        ForEach(ticketVm.ticketsA, id:\.id){ ticket in
            TicketRow(ticket: ticket ,event: ticket.eventt)
                                }
                            }
                            .listStyle(PlainListStyle())
                            .background(.clear)
                            Section{
                                Text("Your total is $\(ticketVm.total)")
                            }
                            .padding()
                        }
                    else if ticketVm.seeEvents {
                        HomePageView()
                    }
                
                else{
                    EmptyTickets()
                }
                       
                        
            }
        
        
        }
                
            
        
    }


struct MyTickets_Previews: PreviewProvider {
    static var previews: some View {
        MyTickets()
    }
}
