//
//  TicketRow.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/17/23.
//

import SwiftUI
import MapKit

struct TicketRow: View {
        @EnvironmentObject var ticketVm : TicketsViewModel
    var ticket: Ticket
    var event : Event

        var body: some View {
                HStack(spacing: 20){
                    Image(uiImage: event.images[0])
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 50)

                        .cornerRadius(10)
                        
    //                    .onTapGesture {
    //                        sheet.toggle()
    //                    }
                        
                    VStack(alignment:.leading,spacing:10){
                        Text(event.name ?? "").bold()
                        // maybe need to change this
                        Text("$\(ticketVm.total)")
                    }
                        Spacer() 
                        Image(systemName: "trash")
                        .padding(.trailing,10)
                        .foregroundColor(.red)
                        .onTapGesture {
                            withAnimation{
                                ticketVm.removeFromCart(ticket)
                            }
                        }
                    
                }
                .padding(.leading)
                .frame(width: 350)
                .frame(height: 70)
                .background(.ultraThinMaterial)
                .background(Image(uiImage: event.images[0])
                    .resizable()
                    .aspectRatio (contentMode: .fill))
                .cornerRadius(20)
            
        }
    }


struct TicketRow_Previews: PreviewProvider {
    static var previews: some View {
        TicketRow(ticket: tickets[0], event: Event(images: [], address: "", coordinates: CLLocationCoordinate2D(), holdCoords: [], date: Date()))
            .environmentObject(TicketsViewModel())
    }
}
