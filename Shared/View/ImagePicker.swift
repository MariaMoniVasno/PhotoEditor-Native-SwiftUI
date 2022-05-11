//
//  ImagePicker.swift
//  PhotoEditor
//
//  Created by Trident on 11/05/22.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var isShowImagePicker : Bool
    @Binding var imageData : Data
    
    // Connecting the Coordinator class with this struct
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator // confirming the delegate
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    
}
class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var parent: ImagePickerView
    
    init(picker: ImagePickerView) {
        self.parent = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageData = (info[.originalImage] as? UIImage)?.pngData(){
            parent.imageData = imageData
            parent.isShowImagePicker.toggle()
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parent.isShowImagePicker.toggle()
    }
    
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let err = error {
            // we got back an error!
            print(err)
        } else {
        
        }
    }
    
}
