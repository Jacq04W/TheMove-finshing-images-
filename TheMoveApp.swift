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
//            Test()
            TabView{
                HomePageView()
                    .tabItem {
            Label("house.fill",systemImage: "house")
                    }

                AddStore()
            .tabItem {
            Label("add event",systemImage: "plus")
                    }

            } .environmentObject(CitiesViewModel())
                .environmentObject(EventsViewModel())
            
        }
    }
}
