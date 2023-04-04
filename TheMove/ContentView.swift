//
//  ContentView.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/10/23.
//

import SwiftUI

struct TrapDoorView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: NoReturnView()) {
                Text("Tap to fall into the trap door 🚪")
            }
        }
    }
}

struct NoReturnView: View { 
    var body: some View {
        Text("Ha! You cannot return.")
            .navigationBarBackButtonHidden(true)
    }
}
     
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrapDoorView()
    }
}
