//
//  SetTripVС + Extension.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 11.08.22.
//

import Foundation
import UIKit

extension SetTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imageURL = info[.imageURL] as? URL,
           let editedImage = info[.editedImage] as? UIImage {
            let newImageURL = documentsURL.appendingPathComponent(imageURL .lastPathComponent)
            let imageJpgData = editedImage.jpegData(compressionQuality: 1)
            do {
                try imageJpgData?.write(to: newImageURL)
                contentOfDerectory?.append(newImageURL)
                previewOfTripPhoto.image = editedImage
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "tableViewChanged"), object: nil)
            } catch {
                print(error)
            }
            dismiss(animated: true)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
