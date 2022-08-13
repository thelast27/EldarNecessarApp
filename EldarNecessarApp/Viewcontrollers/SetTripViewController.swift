//
//  SetTripViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 10.08.22.
//

import UIKit

class SetTripViewController: UIViewController {
    
    let fileManager = FileManager.default
    
    @IBOutlet weak var tripName: UITextField!
    @IBOutlet weak var tripNotes: UITextField!
    @IBOutlet weak var previewOfTripPhoto: UIImageView!
    
    var documentsURL: URL!
    typealias SendTripsDataClosure = (String) -> ()
    typealias SendPicsForTripClosure = (URL) -> ()
    var tripsClosure: SendTripsDataClosure?
    var picsClosure: SendPicsForTripClosure?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    
    @IBAction func saveSetTrip(_ sender: Any) {
        guard tripName.hasText,
              let textForCell = tripName.text
        else { return }
        dismiss(animated: true) { [self] in
            tripsClosure?(textForCell)
        }
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
}




