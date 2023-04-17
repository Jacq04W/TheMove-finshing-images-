//
//  ImageViewModel.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 4/17/23.
//


import Foundation
import UIKit
import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var isPickerShowing : Bool

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
   
    
    
    func makeUIViewController (context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController ()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiviewController: UIViewControllerType, context:
                                Context) {
        
    }
    
 class Coordinator: NSObject, UIImagePickerControllerDelegate,
                    UINavigationControllerDelegate {
     
     var parent: ImagePicker
     
     init(_ picker: ImagePicker) {
         self.parent = picker
     }
     
     
     
     
     
     func imagePickerController(_ picker:UIImagePickerController,
                                didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey:
                                                                        Any]) {
         // Run code when the user has selected an image
         
         print ("image selected")
         if let image =  info[UIImagePickerController.InfoKey.originalImage] as?
                UIImage{
             DispatchQueue.main.async{
                 self.parent.selectedImage = image
                 
             }
         }
         parent.isPickerShowing = false
         
     }
     // dismiss the viwe
     
     
     
     
     func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         // Run code when the user
         print ("canelced")
         parent.isPickerShowing = false
         
         
     }
 }
    
    
    
}

