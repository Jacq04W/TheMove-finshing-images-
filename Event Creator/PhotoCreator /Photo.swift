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



class PhotosViewModel: ObservableObject {
    func saveImage(event: Event,photo: Photo,image: UIImage) async -> Bool {
         let eventID = event.id 
        
        let photoName = UUID().uuidString
        let storage = Storage.storage()
        let storageRef = storage.reference().child("\(eventID)/\(photoName).jpeg")
        
        guard let resizedImage = image.jpegData(compressionQuality: 0.2) else {
            print("🤬 ERROR: could not resize image")
            return false
        }
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        var imageURLString = ""
        
        do {
            let _ = try await storageRef.putDataAsync(resizedImage,metadata: metadata)
            print("😎 image saved")
            do {
                let imageURL = try await storageRef.downloadURL()
                imageURLString = "\(imageURL)"
                
            }catch{
                print("🤬 ERROR: could not get imageUrl after saving image")
                return false
            }
        }
        catch {
            print("🤬 ERROR: Uploading image to firebase")
            return false
        }
        
        let db = Firestore.firestore()
        let collectionString  = "Event/\(eventID)/photos" // might have to rerock 'event' here
        do {
            var newPhoto = photo
            newPhoto.imageURLString = imageURLString
            try await db.collection(collectionString).document(photoName).setData(newPhoto.dictionary)
            print("😎 Data loaded successfully")
            return true
        }catch{
            print("🤬 ERROR: Uploading image do firebase")
            return false
        }
        
    } // end func
    
}
