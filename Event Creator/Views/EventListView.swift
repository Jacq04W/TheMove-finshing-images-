//
//  EventListView.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/13/23.
//

import Foundation
import SwiftUI
// this page builds out what are lists will look like

struct EventListView: View {
    @EnvironmentObject private var vm: EventsViewModel
    @State var isFree = false
    var body: some View {
        List{
            ForEach(vm.events){ event in
                Button{
                vm.showNextEvent(event)
                } label: {
                    listRowView(event)
                }
                    .padding(.vertical,4)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}




struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
            .environmentObject(EventsViewModel())
    }
}







extension EventListView{
    
    // this function  will display and format the info of each location into a card
    private func listRowView(_ event: Event) -> some View{
        HStack{
            if let images = event.images.first{
                Image(images)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading){
                Text(event.name)
                    .font(.headline)
                Text(event.location)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Text("")
                .padding()
        }
        .padding(.leading)
        .frame(width: 350)
        .frame(height: 70)
        .background(.ultraThinMaterial)
        .background(Image(event.images[0])
            .resizable()
            .aspectRatio (contentMode: .fill))
        .cornerRadius(20)
    }
}
