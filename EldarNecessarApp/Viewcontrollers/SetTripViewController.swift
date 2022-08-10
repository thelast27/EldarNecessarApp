//
//  SetTripViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 10.08.22.
//

import UIKit

class SetTripViewController: UIViewController {
    


    @IBOutlet weak var tripName: UITextField!
    @IBOutlet weak var tripNotes: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func saveSetTrip(_ sender: Any) {
        guard tripName.hasText,
        let textForCell = tripName.text
        else { return }
        addItem(name: textForCell)
        dismiss(animated: true, completion: nil)
    }
    

}
