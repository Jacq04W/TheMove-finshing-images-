//
//  ContentView.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/10/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var vm: EventsViewModel
    @EnvironmentObject private var cityVm: CitiesViewModel
    
    
    init () {
        UITabBar.appearance().backgroundColor = UIColor( Color(.gray))
        
    }
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView{
            
            TabView{
                
                
                Group{
                    HomePageView()
                        .tabItem{
                            Label("Home",systemImage: "house.fill")
                        }
                    
                    ProfilePage()
                        .tabItem{
                            Label("Profile",systemImage: "person.fill")
                        }
                    AddStore()
                .tabItem {
                Label("New event",systemImage: "plus")
                        }
                    
              
                    
                    HomePageView()
                    
                    
                    
                    
                    
                        .tabItem{
                            Label("Favorites",systemImage: "heart.fill")
                        }
                    MainTabViews()
                        .tabItem{
                            Label("My Tickets",systemImage: "ticket.fill")
                            
                        }
                    
                    
                    
                    
                }.toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color(.black), for: .tabBar)
            }.toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color(.black), for: .tabBar).accentColor(Color(.white))
            
            
            
        }
        //            .onAppear {
        //            let appearance = UINavigationBarAppearance()
        //            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        //            appearance.backgroundColor = UIColor(Color("secondary"))
        //            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        //        }
        
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CitiesViewModel())
            .environmentObject(EventsViewModel())
    }
}
