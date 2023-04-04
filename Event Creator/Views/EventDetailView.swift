//
//  EventDetailView.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/15/23.
//

import SwiftUI
import MapKit

struct EventDetailView: View {
    @State var isFavorite = false
        @EnvironmentObject private var vm :EventsViewModel
        let event : Event
        var body: some View {
            NavigationView {
                ScrollView{
                    VStack{
                        imageSection
                            .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10 )
                        VStack(alignment: .leading, spacing: 16){
                            HStack{
                                titleSection
                                Spacer()
                                buyButton
                            }
                            
                            Divider()
                            descriptionSection
                            Divider()
                            mapLayer
                        }
                       

                        .toolbar {
                            ToolbarItemGroup(placement: .navigationBarLeading) {
                                            backButton
                            }
                        }
                        
                        .frame( maxWidth: .infinity, alignment: .leading)
                        .padding()
                        
                    }
                    
                }
                .ignoresSafeArea()
//            .overlay( backButton,alignment: .topLeading)
            }
            
        }
    
    }











struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView( event: EventsDataService.events.first!)
            .environmentObject(EventsViewModel())

    }
}


extension EventDetailView {
        private var imageSection : some View  {
            TabView{
                ForEach(event.images,id: \.self){
                    Image($0)
                        .resizable()
                        .scaledToFill()
                    // makes the imaegse the size of the screen
                        .frame(width: UIScreen.main.bounds.width)
                        .clipped()
                    
                }
            }
            .frame(height: 500)
            // makes its so the tab view is scrollable
            .tabViewStyle(PageTabViewStyle())
        }
        
        
        
    // new code
        private var titleSection : some View {
            VStack(alignment: .leading, spacing:8){
                Text (event.name)
                .font (.largeTitle)
                .fontWeight (.semibold)
                Text (event.location)
                    .font(.title3)
                .foregroundColor (.secondary)
               
              
            }
            
            
        }
    // new code
        
        private var descriptionSection : some View {
            VStack(alignment: .leading, spacing:16){
                Text (event.description)
                .font (.subheadline)
                .fontWeight (.semibold)
                .foregroundColor(.secondary)
                
                
                // if the array has a link pass it through
                // link displays the content
                HStack{
                    if let url = URL(string: event.link){
                        Link("Read more on wiki",destination: url)
                            .font(.headline)
                            .tint(.blue)
                        
            
                    }
                    
                if let url = URL(string: event.link){
                    Link("Read more on wiki",destination: url)
                            .font(.headline)
                            .tint(.blue)
                        
            
                    }
                    
                    
                    
                    
                }
                
            }
        }
        
    // new code

        private var mapLayer : some View {
            // how to create a map location that stays constatnt to one region instead of changing
            Map(coordinateRegion: .constant (MKCoordinateRegion ( center: event.coordinates,
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))) ,
            annotationItems: [event]) { event in
                MapAnnotation (coordinate: event.coordinates) {
                    LocationMapPin()
                    
                    
                }

                    
                }
            // adjusts the frame of the map
            .aspectRatio(1, contentMode: .fit)
            // doestn allopw map to be a scrollable
            .allowsHitTesting(false)
            .cornerRadius(30)
            
            

        }
    
    // new code
        private var backButton : some View {
            
            Button{
                vm.sheetLocations = nil
            } label: {
                HStack{
        
                    Image(systemName: "chevron.left.circle.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 40))
                        .cornerRadius(10)
                }
            }
            
        }
        
        // new code
    var buyButton : some View  {
        HStack {
            
            Button {
                 // code here to buy something
                isFavorite.toggle()
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .font(.headline)
                        .padding (16)
                        .foregroundColor (.primary)
                        .frame(width: 50,height:50)

                        .background(.ultraThinMaterial)
                        .background(.purple.opacity(0.7))

                        .cornerRadius(50)
                .shadow (radius:4)
                    
            }
            
            
            Button {
                 // code here to buy something
                } label: {
    Image(systemName: "ticket")                    .font(.headline)
                        .padding (16)
                        .foregroundColor (.primary)
                        .frame(width: 50,height:50)

                        .background(.ultraThinMaterial)
                        .background(.purple.opacity(0.7))

                        .cornerRadius(50)
                .shadow (radius:4)
                    
            }
        }
    }
        
        
        
        
        
    }
    // extension
    

