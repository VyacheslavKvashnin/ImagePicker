//
//  ImagePicker.swift
//  ImagePicker
//
//  Created by Вячеслав Квашнин on 20.07.2021.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isVisible: Bool
    @Binding var image: Image?
    
    var sourceType: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isVisible: $isVisible, image: $image)
    }
  
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = UIImagePickerController()
        
        vc.allowsEditing = true
        vc.sourceType = sourceType == 1 ? .photoLibrary : .camera
        
        vc.delegate = context.coordinator
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        @Binding var isVisible: Bool
        @Binding var image: Image?
        
        init(isVisible: Binding<Bool>, image: Binding<Image?>) {
            _isVisible = isVisible
            _image = image
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            image = Image(uiImage: uiImage)
            isVisible = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isVisible = false
        }
    }
}
