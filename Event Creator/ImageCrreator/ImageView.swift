//
//  ImageView.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 4/17/23.
//

import SwiftUI
import PhotosUI
import FirebaseStorage
import FirebaseDatabase
import FirebaseFirestoreSwift
import FirebaseFirestore

struct ImageView: View {
    @EnvironmentObject private var vm: EventsViewModel
    @State var isPickerShowing = false
    @State var selectedImage :UIImage?
    @State var retrievedImages = [UIImage]()
    var body: some View {
        VStack{
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .frame(width: 200,height:200)
            }
            Button("select a photo"){
                isPickerShowing = true
            }
            if selectedImage != nil {
                Button("Upload"){
                    uploadphotos()
                }
                Divider()
                HStack{
                    // loop throught the image=s
                    ForEach(retrievedImages,id:\.self){image in
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 200,height: 200)
                    }
                    
                }
                
                
                
            }
        }.sheet(isPresented: $isPickerShowing, onDismiss: nil){
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
        }
        .onAppear{
            retrievephotos()
        }
        
    }
    
    
    func uploadphotos(){
        guard selectedImage != nil else {
        return}
        
        let storageRef = Storage.storage().reference()
        
        let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
        guard imageData != nil else {
            return
        }
        // path to the firebase folder
        // this he path to the storage
        let path =
        "images/\(UUID().uuidString).jpeg"
        let fileRef = storageRef.child(path)
        let uploadTask = fileRef.putData(imageData!,metadata: nil){
            metaData, error in
            
            
            if error == nil && metaData != nil{
                let db = Firestore.firestore()
                // creates a new document in fb
                db.collection("Event").document().setData(["url":path]){
                    error in
                    // if there are no errors , dispaly new image
                    if error == nil {
                        // add the uploaded image to thw list of images for display
                self.retrievedImages.append(self.selectedImage!)
                        
                    }
        
                }
                
                
            }
            
        }
    }
   
    func retrievephotos(){
        // get dat from Fb
        let db = Firestore.firestore()
        db.collection("Event").getDocuments { snapshot, error in
            if error == nil && snapshot != nil {
        // all the retreived pics are here
//               snapshot?.documents
                var paths = [String]()
                // loop through all the retunerde docs
                for doc in snapshot!.documents {
                    // exctarce the file path and add array
                   
                if let url = doc["url"] as? String {
                        paths.append(url)
                    }
                    
                    
                    print("Url Appeneds succes")
                }
                // loop througth each file and fetch thje data
                for path in paths {
                    // get ref to stroage
                    let storageRef = Storage.storage().reference()
                    // specify path
                    let fileRef = storageRef.child(path)
                    // retrieve data
                    fileRef.getData(maxSize: 5 * 1024 * 1024){
                        data, error in
                        if error == nil && data != nil {
                            // put this in array for display
                            if let image = UIImage(data: data!){
                                DispatchQueue.main.async {
                                    retrievedImages.append(image)
                                }
                            }
                        }
                    }
                    
                    
                }
                
            }
        }
        // get the image in stoage for each refernce
        
        // display the image
    }
    
    
    
}

struct ImagePickerView__Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
            .environmentObject(EventsViewModel())

    }
}
