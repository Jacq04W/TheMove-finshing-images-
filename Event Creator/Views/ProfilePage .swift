//
//  ProfilePage .swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/29/23.
//

import SwiftUI

struct ProfilePage: View {
    // make it so its compatible
    var body: some View {
        NavigationView {
            VStack {
                ShowHeader()
                Divider()
                Spacer()
                 
                List{
                    // create a card to pass through here
                    HStack{
                        Image(systemName: "mail")
                        Text("Kbryant24@gmail.com")
                    }
//                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    
                    HStack{
                        Image(systemName: "person.crop.circle")
                        Text("Bmaba428")
                    }
                    .frame(height: 40)
                    HStack{
                        Image(systemName: "phone.and.waveform.fill")
                        Text("313-444-5555")                    }
                    
                    .frame(height: 40)
                    
                    
                    HStack{
                        Image(systemName: "qrcode.viewfinder")
                        Text("EventCodes")
                    }
                    .frame( height: 40)
                    
                    HStack{
                        Image(systemName:"globe.americas.fill") 
                        Text("USA")
                    }
                    .frame( height: 40)
                    HStack{
                        Image(systemName: "mail")
                        Text("Kbryant24@gmail.com")
                    }
                    .frame( height: 40)
                    

                }
                .background(.red)
                    
                
                
                
                
                
            }
            .navigationTitle("Profile")
        }
        
        
        
        
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}


// custom var


struct ShowHeader: View {
    var body: some View {
        HStack{
            Image("sosa")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 130,
                       height: 130)
            
            VStack(alignment: .leading, spacing: 9){
                Text("Kobe Bryant")
                    .bold()
                    .font(.title)
                
                Text("@Bmamba428")
                    .font(.headline)
                
                HStack {
                    NavigationLink(destination: MyTickets()) {
                        Text("My Tickets")
                            .bold()
                            .frame(width: 120,height: 40)
                            .background(.green)
                            .cornerRadius(10)
                    }                .navigationBarBackButtonHidden(true)

                    .foregroundColor(.white)

                 
                    Button{}
                label:{
                    Text("Edit")
                        .bold()
                        .frame(width: 50,height: 40)
                        .background(.green)
                        .cornerRadius(10)
                }
                .foregroundColor(.white)
                .offset(x:1)
                }
                
                
                
            }
            Spacer()
        }.frame(maxWidth: .infinity)
            .padding(.leading)
          
    }
}
