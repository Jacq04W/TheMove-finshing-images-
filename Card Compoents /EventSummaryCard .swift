//
//  EventSummaryCard.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 4/29/23.
//

import SwiftUI
import CoreLocation
import FirebaseCore
import FirebaseFirestore
import FirebaseDatabase
import MapKit
import SwiftUI
import FirebaseStorage

struct EventSummaryCard: View {
    @EnvironmentObject private var vm: EventsViewModel
  var event: Event
    var body: some View {
        VStack{
            // maybe a multitude of pics
            // TODO: this should be event.coverPhoto
            Image("sosa")
                .resizable()
                .scaledToFill()
                .frame(width: 333, height: 113)
                .cornerRadius(10)
                .offset(y:-19)

    
            HStack{
                VStack{
                    Text(event.name ?? "")
                        .font(.system(size: 25))
                        .offset(y:-10)
                        .bold()
                    HStack{
                        Image(systemName: "calendar")
                        Text(event.startDate ?? "")
                        Text("✘12:00 PM")
                        
                    }                        .font(.system(size: 25))

                    HStack(spacing:1){
                        Image(systemName: "mappin")
                            .foregroundColor(.gray)
                        Text(event.address ?? "")
                     
                    }                        .font(.system(size: 25))
                        .offset(y:13)

                    .padding(.trailing,10)
                }
                .overlay(
                    Text("$50")
            .font(.system(size: 25))
            .offset(x:135,y:40)
            .bold()
)
            }
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 10)
                .fill (.red)
                .frame(width: 333, height: 125)
            }
            .offset(y:15)
        }
        .background{
            RoundedRectangle(cornerRadius: 21)
            .fill (.blue)
            .frame(width: 370, height: 303)
          }
        .overlay{
            Button{
                //Todo: Alow discard event
            }
        label:{
            Image(systemName: "x.circle.fill")
                .offset(x: 170, y: -145)
                .font(.system(size: 48))
                .foregroundColor(.black)
        }
            
        }
        
 
    }
}

struct EventSummaryCard__Previews: PreviewProvider {
    static var previews: some View {
        EventSummaryCard(event:Event( name: "Jacq's Kick back", category: "kickback", TType: "Party", location: "444 Joy rd.", price: 20, description: "come turnuo with me", startDate: "Friday,Jun 2", organizerName: "Jacq", phoneNumber: "313-777-2222", images: [], address: "777 Woodward", coordinates: CLLocationCoordinate2D(), holdCoords: [], date: Date(), link:" ")
                                )
            .environmentObject(EventsViewModel())

    }
}
