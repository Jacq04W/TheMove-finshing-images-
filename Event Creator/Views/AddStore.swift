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
    @State var isPickerShowing = false

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
                        Button("select a photo"){
                            isPickerShowing = true}
                       
                        
                    }
                    Section {
                        
                        if vm.selectedImage != nil{
                            Button("Add event"){
                                vm.geocode()
                        print("this is the stuff in the array \(vm.events)")
                            }
                        }
                    }
                }
                
                HStack{
                    // loop throught the image=s
                    ForEach(vm.retrievedImages,id:\.self){image in
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 200,height: 200)
                    }
                    
                    
                    //                Map(coordinateRegion: $vm.mapRegion,
                    //                        annotationItems: vm.events,
                    //                        annotationContent: { location in
                    //                        MapAnnotation(coordinate: location.coordinates){
                    //
                    //
                    //                            MapPins()
                    //
                    //                        }
                    //
                    //                        })
                    //                .ignoresSafeArea()
                }
                
            }.sheet(isPresented: $isPickerShowing, onDismiss: nil){
                ImagePicker(selectedImage: $vm.selectedImage, isPickerShowing: $isPickerShowing)
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
