//
//  HomePageView.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/13/23.
//

import SwiftUI
import MapKit
struct HomePageView: View {
    @EnvironmentObject private var vm: EventsViewModel
    @EnvironmentObject private var cityVm: CitiesViewModel 

    var body: some View {
        ZStack{
    // only regions that will be showed is the ones that we have data for
                mapLayer
                .ignoresSafeArea()
            VStack(spacing: 0){
                header
                Spacer() 
                footer
                .padding()
                .padding(.bottom,15)
                 eventPreviewCard
            }
//            .task {
//                            vm.fetchdata()
//                        }
            .refreshable {
                vm.refreshdata()
            }
        }.navigationBarBackButtonHidden(true)
        .sheet(isPresented: $vm.showLocationsList) {
            EventListView()
                .presentationDetents([.fraction(0.5)])
        }
        .sheet(item: $vm.sheetLocations){
            event in
            // makes sure the preview card is diplaying the right event info
            EventDetailView(event: event)
        }
        


    }

    
     
    
// custom varibales
    var footer: some View {
       // show list button
        VStack {
            Button{
                vm.showLocationsList.toggle()
            }
            label:{
                Image(systemName:"list.bullet.indent")
                    .font(.title2)
                    .fontWeight (.bold)
                    .foregroundColor (.primary)
                    .frame(width: 120, height: 30)
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow (color: Color.black.opacity (0.3), radius: 20,
                 x: 0, y: 15)
        .offset(x:20,y: 100)
    }
    
    // new code
    var header :some View {
        HStack {
                ChangeCityButton()
            HStack{
                Text("Active Events")
//                    .font(.system(size: 13))
                    .font(.subheadline )
                Text("\(vm.events.count)")
                    .foregroundColor(.green)
            }
            .frame(width: 150, height: 40)
            .fontWeight(.bold)
            .background(.thickMaterial)
            .cornerRadius(9)
            .padding(.leading,8)
            Spacer()
            Button(){
            } label: {
                VStack{
                    Image(systemName: "paperplane.fill")
                        .frame(width: 40, height: 40)
                        .fontWeight(.bold)
                        .background(.thickMaterial)
                        .cornerRadius(9)
                    
                }
            }
            .padding(.trailing)
        }
        .shadow(color: Color.black.opacity (0.4), radius: 20,
                 x: 0, y: 15)
    }
   
    private var mapLayer : some View {
                // add map to screen
                // add pins to screen ↓
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.events,
            annotationContent: { event in
            MapAnnotation(coordinate: event.coordinates){
             //custom pins
                    LocationMapPin()
                    .scaleEffect(vm.eventLocation == event ? 1 : 0.7)
                    .onTapGesture {
                        vm.showNextEvent(event)
                    }
            }
        })
    }
     // new code
    var eventPreviewCard : some View {
        ZStack {
            
            // // lets the card be == to the current lo
            ForEach (vm.events) { event in
                if vm.eventLocation == event {
                    
                     EventPreviewCard(event: event)
                    .shadow (color: Color.black.opacity (0.3),
                                 radius: 20)
                        .padding()
                    
                        .transition(.asymmetric(
                            
                            insertion: .move(edge: .trailing),
                            
                            removal: .move (edge: .leading)))
                    
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
} // end



struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .environmentObject(EventsViewModel())
            .environmentObject(CitiesViewModel())


    }
}

