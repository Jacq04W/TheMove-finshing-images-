//
//  CityList.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/13/23.
//

import SwiftUI
import Foundation
struct CityListView: View {
    @State var info: String = ""
    @State var searchable = ""
    @Environment(\.dismiss) var dismiss

   
    
    @EnvironmentObject private var vm: EventsViewModel

    
    @EnvironmentObject private var cityVm: CitiesViewModel

    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 30)
            .fill(.ultraThickMaterial)
            .frame(width:380)
            .frame(height: 120)
        
        NavigationView {
                
            if cityVm.changeCityLocation{
                
                
                ZStack {
                    //                    Color.black
                    //                        .ignoresSafeArea()
                    //                    shape
                    //                        .offset(y:-330)
                    VStack(spacing:10){
                        shape
                            .overlay(
                                VStack{
                                    Text("Waddup doe")
                                        .font(.system(size: 50,weight: .bold))
                                        .offset(y:-40)
                                        .foregroundColor(.blue)
                                        .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 5)
                                    HStack{
                                        Image(systemName: "mappin")
                                            .foregroundColor(.red)
                                        Text(cityVm.newMapLocation.cityName)
                                    }
                                    .font(.system(size: 30,weight: .bold))
                                    .offset(y:-24)
                                    .foregroundColor(.blue)
                                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 5)
                                    
                                }
                                
                            )
                            .offset(x:0,y:30)
                        //
                        //                            Text("Lets find your next unforgettable event.")
                        //                                .fontWeight(.black)
                        //                                .padding(.leading,5)
                        //                                .padding(.trailing,5)
                        //                                .frame(maxWidth:.infinity)
                        //                                .cornerRadius(9)
                        //                                .background(.ultraThinMaterial)
                        //                                .frame(maxWidth: .infinity)
                        //                                .font(.system(size: 35))
                        //                                .cornerRadius(26.0)
                        //                                .shadow(color: .black, radius: 10, x: 20)
                        //                                .offset(y:30)
                        // custom font here
                        //
                        
                        VStack(spacing: -30){
                            HStack{
                                nearbyButton
                                    .padding(.leading)
                                Spacer()
                                OnlineButton
                                    .padding(.trailing)
                            }
                            .offset(y:-23)
                            VStack(spacing: -2){
                                
                                
                                Text("Popular Locations")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .padding(.trailing,220)
                                    .padding(.top,20)
                                
                                
                                ScrollView {
                                    ForEach(cityVm.cities){ city in
                                        Button{
                                            //                                cityVm.showNextLocation(location: location)
                                        } label: {
                                            ZStack{
                                                Image(city.imageNames[0])
                                                    .resizable()
                                                    .scaledToFill()
                                                    .foregroundColor(.blue)
                                                    .frame(height: 100)
                                                    .frame(maxWidth:.infinity)
                                                    .cornerRadius(9)
                                                VStack{
                                                    Text(city.id)
                                                        .bold()
                                                        .frame(width: 180, height: 40, alignment: .center)
                                                        .background(.thinMaterial)
                                                        .cornerRadius(9)
                                                }
                                                
                                            }
                                        }
                                        .padding()
                                        .listRowBackground(Color.black)
                                    }
                                }
                                .frame(maxHeight: .infinity)
                            }
                            .offset(y:60)
                            
                        }
                        .offset(y:80)
                        Spacer()
                        
                    }
                    
                    .searchable(text: $searchable, prompt: "Get Active In a New City")
                    
                }
                .toolbar {ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        dismiss.callAsFunction()
                    }
                }
                }
                
                
            }
                
            //            .navigationTitle("Choose your location")
        }
        
    }
    
    // custom varibales
    
    
    
       
    
     
    
    var nearbyButton : some View {
        // should take user to their locartion
     
        Button{
            cityVm.showCurrentLocation()
        }
    label:{
            HStack{
                Image(systemName: "figure.wave")
                    .frame(width: 35, height: 35)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                VStack(alignment: .leading){
                    Text("Nearby")
                        .foregroundColor(.blue)
                        .font(.headline)
                    
                    Text("Current Location")
                        .foregroundColor(.gray)
                        .font(.footnote)

                }
        }
        

        }
    }
    
    // new code
    var OnlineButton : some View {
        
        NavigationLink(destination: HomePageView()) {
            HStack{
                Image(systemName: "magazine")
                    .frame(width: 35, height: 35)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                VStack(alignment: .leading){
                    Text("Online Events")
                        .foregroundColor(.blue)
                        .font(.headline)
                    
                    Text("Check It out")
                        .foregroundColor(.gray)
                        .font(.footnote)
                    
                }
            }
        }
       
    }
    
    
}




struct CityListView_Previews: PreviewProvider {
    static var previews: some View {
        CityListView()
            .environmentObject(CitiesViewModel())

    }
}



extension CityListView{
    // this function  will display and format the info of each location into a card
    private func newListRowView(location: City) -> some View{
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading){
                Text(location.cityName)
                    .font(.headline)
                Text(location.stateName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}
