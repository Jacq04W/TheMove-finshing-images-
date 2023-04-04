//
//  CartButton.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/16/23.
//

import SwiftUI

struct CartButton: View {
    @EnvironmentObject private var ticketVm: TicketsViewModel
    var numberOfProducts : Int
    var body: some View {
        
            ZStack(alignment: .topTrailing){
                Image(systemName: "ticket.fill")
                    .font(.system(size: 30))
                    .padding(.top,5)
                if numberOfProducts > 0 {
                    Text("\(numberOfProducts)")
                        .font(.system(size: 15)).bold()
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .frame(width: 20, height: 20)
                        .background(.red)
                        .cornerRadius(50)
                        .offset(x:5)

                    
                }
                
            }
           
            
            
            
        }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberOfProducts: 4)
            .environmentObject(TicketsViewModel())

    }
}
