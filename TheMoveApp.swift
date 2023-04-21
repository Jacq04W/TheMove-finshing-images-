//
//  TheMoveApp.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/10/23.
//

import SwiftUI
import Firebase
@main
struct TheMoveApp: App {
    @EnvironmentObject private var vm: EventsViewModel
    @EnvironmentObject private var cityVm: CitiesViewModel
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        
        
        WindowGroup {
            HomePageView()
                .environmentObject(CitiesViewModel())
                .environmentObject(EventsViewModel())

        }
    }
}
