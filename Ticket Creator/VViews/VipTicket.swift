//
//  officialTickets .swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/10/23.
//

import SwiftUI

struct VipTickets: View {
    @EnvironmentObject  var ticketVm: TicketsViewModel
    var event: Event
    var ticket: Ticket

    var body: some View {
    
        realTicket
        
    }
}

struct VipTickets_Previews: PreviewProvider {
    static var previews: some View {
        VipTickets(event: EventsDataService.events.first!, ticket: tickets[0])
            .environmentObject(EventsViewModel())

    }
}









extension VipTickets{
    
    
     var realTicket : some View {
        ZStack(alignment: .bottom){
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .topTrailing))
                .frame(width: 270,height: 260)
                .scaledToFit()
         // header
            VStack{
                Image(event.images[0])
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 250,height: 150)
                    .padding(.bottom,130)
                    .shadow(radius: /*@START_MENU_TOKEN@*/27/*@END_MENU_TOKEN@*/)
                
            }
            // details box
//            VStack {
//                VStack(alignment: .leading){
//                    Text("\(event.name)")
//                            .bold()
//                    Text("\(event.startTime ?? "" )")
//                            .font(.caption)
//                    Text("\(event.location)")
//                                .font(.caption)
//                    }
//                .padding(.bottom,25)
//                    .padding()
//                    .frame(width: 250,height: 100, alignment: .leading)
//                    .background(.ultraThinMaterial)
//                .cornerRadius(20)
//            }
//            .padding(.bottom,9)
            
// buttons
            HStack{
                Button(){
                } label: {
                    ZStack(alignment: .leading){
                        Image(systemName: "heart")
                            .frame(width: 30,height: 30)
                            .background(.ultraThinMaterial)
                            .cornerRadius(9)
                        
                    }
                    .padding(.leading,60)
                }
                Spacer()
                Button(){
                    ticketVm.addToCart(ticket)
                } label: {
                    ZStack(){
                            Text("Get a ticket")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .frame(width: 130,height: 30)
                            .background(.purple)
                            .opacity(0.7)
                            
                            .cornerRadius(9)
                    }
                    
                }.padding(.trailing,30)
            }
            .bold()
            .padding(.bottom,15)
//            .padding(.leading,30)
        }
        .frame(width: 200,height: 250)
    .shadow(radius: 3)
    }
    
    
    
    
}
