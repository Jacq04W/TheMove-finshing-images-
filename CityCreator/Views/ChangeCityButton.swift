//
//  ChangeCityButton.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/14/23.
//

import SwiftUI

struct ChangeCityButton: View {
    @EnvironmentObject private var vm: CitiesViewModel
    
    var body: some View {
        
        VStack{
            Button(){
                vm.changeCityLocation.toggle()
            } label: {
                Text(vm.newMapLocation.cityName) 
                    .frame(width: 110, height: 40)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .background(.thickMaterial)
                    .cornerRadius(9)
                    .padding(.leading,9)
                    .overlay(alignment: .leading){
                        Image (systemName: "mappin")
                            .font(.subheadline)
                            .foregroundColor (.primary)
                            .padding()
                    }
                    .overlay(alignment: .trailing){
                        Image (systemName: "chevron.down")
                            .foregroundColor(.blue)
                            .bold()
                            .foregroundColor (.primary)
                            .padding(.trailing,2)
                            .rotationEffect(Angle(degrees:
                                                    vm.changeCityLocation ? 180 : 0))
                    }
                
            }
            
        }
        .sheet(isPresented: $vm.changeCityLocation) {
            CityListView()
            
        }
    }
}
struct ChangeCityButton_Previews: PreviewProvider {
    static var previews: some View {
        ChangeCityButton()
            .environmentObject(CitiesViewModel())
    }
}
