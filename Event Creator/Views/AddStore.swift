//
//  AddStore.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 4/15/23.
//


import CoreLocation
import FirebaseCore
import FirebaseFirestore
import FirebaseDatabase
import MapKit
import SwiftUI


struct AddStore: View {
   
     @StateObject private var vm = EventsViewModel()
    var body: some View {
        NavigationView{
            VStack {
                Form {
                    Section(header: Text("Event Details")) {
                        TextField("Name",text:$vm.name)
                        TextField("Description",text: $vm.description)
                        TextField("Address",text:$vm.addressString)
                        DatePicker(selection:$vm.date,label:{ Text("Date")})
                    }
                    Section {
                        Button("Add event"){
                            vm.geocode()
                            print("this is the stuff in the array \(vm.events)")
                        }
                    
                    }
                }
                Map(coordinateRegion: $vm.mapRegion,
                        annotationItems: vm.events,
                        annotationContent: { location in
                        MapAnnotation(coordinate: location.coordinates){
                        
                            
                            MapPins()
                            
                        }
                
                        })
                .ignoresSafeArea()
                
            }
            .task {
                 vm.fetchdata()
            }
            .refreshable {
                 await vm.refreshdata()
        }
        }
        
        
    }
}

struct AddStore_Previews: PreviewProvider {
    static var previews: some View {
        AddStore()
        .environmentObject(EventsViewModel())
        
    }
}
