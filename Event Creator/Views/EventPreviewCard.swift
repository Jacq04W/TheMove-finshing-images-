//
//  EventPreviewCard.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/15/23.
//

import SwiftUI

struct EventPreviewCard: View {
    @EnvironmentObject private var vm : EventsViewModel
    var event: Event

    var body: some View {
            HStack(alignment: .bottom, spacing: 0) {
                VStack(alignment: .leading, spacing: 16){
                    imageSection
                    titleSection
                }
                VStack(spacing: 8){
                    learnButton
                   nextButton
                }
            }
            .padding (20)
            .background(
                RoundedRectangle (cornerRadius: 10)
                .fill (.ultraThinMaterial)
            
            .offset (y: 65))
            .cornerRadius (10)
            
        




    }
}

struct EventPreviewCard_Previews: PreviewProvider {
    static var previews: some View {
        EventPreviewCard(event: EventsDataService.events.first!)
            .padding()
            .environmentObject(EventsViewModel())


    }
}





// custom variables
extension EventPreviewCard{
    private var imageSection : some View {
        ZStack{
            if let images = event.images.first {
                Image (images)
                    .resizable ()
                    .scaledToFill()
                    .frame (width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
}



extension EventPreviewCard{
    private var titleSection : some View {
        VStack(alignment: .leading){
            
            Text(event.name ?? "" )
                .font (.title2)
                .fontWeight (.bold)
            Text(event.location ?? "" )
                .font (.subheadline)
        }
        .frame(maxWidth:.infinity,alignment: .leading)
        
    }
    
    
    
    
    // new code
    private var learnButton : some View {
        Button{
            // makes sure the sheet that is pooping up is displaying the corerct data
            vm.sheetLocations = event
        } label: {
            Text("Party Page")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
        
    }
    
    // new code
    private var nextButton : some View {
        Button{
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
        
    }
    
}
