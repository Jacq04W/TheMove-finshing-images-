//
//  LinkCards.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/30/23.
//

import SwiftUI

struct LinkCards: View {
    let event : Event

    var body: some View {
        
        if let url = URL(string: event.link){
            Link("wiki",destination: url)
                
                .font(.headline)
                .tint(.blue)
            

        }
            
            
            
            

        }
               
        
    }


struct LinkCards_Previews: PreviewProvider {
    static var previews: some View {
        LinkCards(event: EventsDataService.events.first!)
    }
}
