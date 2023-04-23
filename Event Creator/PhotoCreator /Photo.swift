//
//  Photo.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 4/23/23.
//
import CoreLocation
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseDatabase
import FirebaseStorage
import Foundation
import MapKit
import SwiftUI

struct Photo : Identifiable, Codable {
    @DocumentID var id : String?

    var imageURLString = ""
    var description = ""
    var reviewer = Auth.auth().currentUser?.email ?? ""
    var postedOn = Date()
    var dictionary: [String: Any]{
        return [ "imageURLString" : imageURLString, "description": description,"reviewer" : reviewer,"postedOn" : Timestamp(date: Date())]
    }
    
}
