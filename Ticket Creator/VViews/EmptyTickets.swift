//
//  Tickets.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/10/23.
//

import SwiftUI

struct EmptyTickets: View {
    @EnvironmentObject private var ticketVm: TicketsViewModel
    var body: some View {
            
          emptyTickets
    }
   
}

struct Tickets_Previews: PreviewProvider {
    static var previews: some View {
        EmptyTickets()
    }
}





extension EmptyTickets{
    var emptyTickets : some View {
        // creating background for this page
        VStack {
            ZStack {
                
                Color(red: 0.11, green: 0.11, blue: 0.114)
                // create graphics
                ZStack{
                    Circle()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(Color(red: 0.173, green: 0.173, blue: 0.177))
                        .padding(.bottom,90)
                    Image(systemName: "ticket")
                        .resizable()
                        .foregroundColor(Color(red: 0.325, green: 0.325, blue: 0.33))
                        .frame(width: 50, height: 40)
                        .padding(.bottom,90)
                    
                }
                .offset(y:-50)

                // words on the screen
                VStack(spacing:10){
                    Text("No tickets yet")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Make sure you're in the same account that")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                    
                    Text("you purchased your tickets")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                }
                .offset(y:20)
                
                // footer
                VStack{
                    // some live events 
                    Text("See whats up with live events near you ")
                        .bold()
//                        .offset(y:250)
                    
                    NavigationLink{
                    HomePageView()
                        
                    } label: {
                        Text("See events")
                            .frame(width: 150,height:50)
                            .background(Color(hue: 1.0, saturation: 0.929, brightness: 0.898) )
                            .fontWeight(.bold)
                            .buttonStyle(.bordered)
                            .cornerRadius(10)
                        
                        // have some one fix shadow here
//                          .shadow(color: .black.opacity(0.6), radius: 7,x:14,y:-2)
                    }
//                    .offset(y:250)
                    
                }
                .offset(y:220)

            }
            
            .foregroundColor(.white)
        }
        .ignoresSafeArea()
        .navigationTitle("Tickets")
        
    }
    
    
    
}
