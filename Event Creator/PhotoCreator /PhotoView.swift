//
//  PhotoView.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 4/23/23.
//

import SwiftUI
import CoreLocation

struct PhotoView: View {
    @EnvironmentObject var eventVm: PhotosViewModel
    @State private var photo = Photo()
    var uiImage: UIImage
    var event: Event
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack{
            VStack{
Spacer()
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                Spacer()
                
                TextField( "Description", text: $photo.description)
                    .textFieldStyle(.roundedBorder)
                
                
                Text("by: \(photo.reviewer) on: \(photo.postedOn.formatted(date: .numeric, time: .omitted))")
.lineLimit(1)
.minimumScaleFactor(0.5)
            }
            .padding()
            .toolbar{
                ToolbarItem(placement:.cancellationAction){
                    Button("cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .automatic){
                    
                    Button("save"){
                        Task{
                            let success = await eventVm.saveImage(event: event, photo: photo, image: uiImage)
                            if success {
                                dismiss()
                            }
                        }
                    }
                }
            }
        }// nav stack
    }
    
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(uiImage: UIImage(named:"sosa") ?? UIImage(),event: Event( name: "Mike", category: "kickback", TType: "Party", location: "777 Woodward", price: 20, description: "come turnuo with me", startDate: "7/11", organizerName: "Jacq", phoneNumber: "313-777-2222", images: [], address: "777 Woodward", coordinates: CLLocationCoordinate2D(), holdCoords: [], date: Date(), link:" "))
            .environmentObject(EventsViewModel() )
    }
}
