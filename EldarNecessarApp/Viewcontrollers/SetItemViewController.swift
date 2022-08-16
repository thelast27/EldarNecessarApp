//
//  SetItemViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 16.08.22.
//

import UIKit

class SetItemViewController: UIViewController {
    
    
    let categoryPickerView = UIPickerView()
    
    @IBOutlet weak var itemQtyLabel: UILabel!
    @IBOutlet weak var qtyItemsStepper: UIStepper!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemDescrip: UITextField!
    
    
    var categoryPickerArray: [String] = ["Outdoor", "Clothing", "Comfort & Entertaiment", "Documents", "Electronic & Gadget", "Family", "Medical & Health", "Toiletries", "Others"]
    var itemArray: [String] = []
    typealias SendItemDetails = ([String]) -> ()
    var itemsClosure: SendItemDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        qtyItemsStepper.wraps = false
        qtyItemsStepper.autorepeat = true
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        
        categoryTextField.inputView = categoryPickerView
        
    }
    
    
    @IBAction func qtyItemsStepperAction(_ sender: UIStepper) {
        itemQtyLabel.text = Int(sender.value).description
    }
    
    
    
    @IBAction func cancelSetItem(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveItem(_ sender: Any) {
        guard itemName.hasText,
              let text = itemName.text
        else { return }
        itemArray.append(text)
        if itemDescrip.hasText {
            itemArray.append(itemDescrip.text!)
        }
        guard itemQtyLabel != nil else { return }
        itemArray.append("\(itemQtyLabel.text ?? "0")")
        itemsClosure?(itemArray)
        dismiss(animated: true)
    }
}


