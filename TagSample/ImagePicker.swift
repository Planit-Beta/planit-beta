//
//  ImagePicker.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/04/21.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    // MARK: - Working with UIViewControllerRepresentable
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator  // Coordinater to adopt UIImagePickerControllerDelegate Protcol.
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

    // MARK: - Using Coordinator to Adopt the UIImagePickerControllerDelegate Protocol
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject private var firestoreViewModel = FirestoreViewModel.shared
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
     
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
                if parent.firestoreViewModel.selectedImage.count == 0 {
                    parent.firestoreViewModel.selectedImage.append((image.jpegData(compressionQuality: 0.3)! as NSData) as Data)
                } else {
                    parent.firestoreViewModel.selectedImage[0] = (image.jpegData(compressionQuality: 0.3)! as NSData) as Data
                }
                
            }
     
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
