//
//  LocationsDataService.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 3/13/23.
//

import Foundation
import MapKit
// this page is where we would store our data from firebase instead we have hard data we have here for example
// we need to to use the data from online to input exsiitng info

class EventsDataService{
    
    // this is controlling the ui
    
    static let events: [Event] = [
    
   Event(name: "Jacq's kick back ", category: "Kick Back ", TType: "Kick back ", location: "444 Joy rd.", description: "come turn up with me", organizerName: "Jacq", phoneNumber: "313-444-5555", images: [
   "shake1",
   "shake2",
   "shake3"
   
   ], coordinates:  CLLocationCoordinate2D(latitude: 42.476954474929244, longitude: -83.14910857471085), link: "https://detroitzoo.org"),
   
   
   Event(id: "", name: "Blowed pt.2", category: "party", TType: "", location: "777 E.Jefferson", price: 50, description: "We going up this weekend Dispensary truck and food truck on site", startDate: "4/20", startTime: "1Pm", endTime: "W/e", organizerName: "Aaron", phoneNumber: "313-222-2222", images: [
    
            "annex1",
             "annex2",
            "annex3",
   
   ], coordinates: CLLocationCoordinate2D(latitude: 42.33708931639186, longitude: -83.05133452845804), link: "http://theannexdetroit.com")
   
   
  
    
    ]
        
    }
    
    



//    static let events: [Event] = [
//        Event(
//            name: "Annex",
//            cityName: "Detroit",
//            coordinates: CLLocationCoordinate2D(latitude: 42.33708931639186, longitude: -83.05133452845804),
//            description: "Neon-lit nightclub featuring DJs, EDM musicians & dancing, plus VIP table service for bottles.",
//            images: [
//                "annex1",
//                "annex2",
//                "annex3",
//            ],
//            link: "http://theannexdetroit.com"),
//        Event(
//            name: "Club Bleu",
//            cityName: "Detroit",
//            coordinates: CLLocationCoordinate2D(latitude: 42.33574451152823, longitude: -83.04960254380238),
//
//            description: "Stylish 21+ nightclub & bar featuring live music & DJs spinning electronic & hip-hop.",
//            imageNames: [
//                "bleu1",
//                "bleu1",
//                "bleu1",
//            ],
//            link: "https://www.facebook.com/bleudetroitofficial/"),
//        Event(
//            name: "Redford Theatre",
//            cityName: "Detroit",
//
//            coordinates: CLLocationCoordinate2D(latitude: 42.4176547957332, longitude:  -83.25752910354844),
//            description: "This ornate, veteran performance space with a working pipe organ hosts classic films & stage plays.",
//            imageNames: [
//                "hunt1",
//                "hunt2",
//                "hunt3"
//            ],
//            link: "https://www.huntingtonplacedetroit.com"),
//        Event(
//            name: "Detroit Zoo",
//            cityName: "Detroit",
//            coordinates: CLLocationCoordinate2D(latitude: 42.476954474929244, longitude: -83.14910857471085),
//            description: "A zoo located in the cities of Huntington Woods and Royal Oak in the U.S. state of Michigan. Spanning 125 acres, it houses more than 2,000 animals and more than 245 different species.",
//            imageNames: [
//                "shake1",
//                "shake2",
//                "shake1",
//            ],
//            link: "https://detroitzoo.org"),
//
//
//    ]
