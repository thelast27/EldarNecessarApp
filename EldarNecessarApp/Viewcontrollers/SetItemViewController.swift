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
    
    
    private var categoryPickerArray: [String] = ["Outdoor", "Clothing", "Comfort & Entertaiment", "Documents", "Electronic & Gadget", "Family", "Medical & Health", "Toiletries", "Others"]
    var otherItemDetails: [String] = []
    typealias SendItemName = (String) -> ()
    var itemsClosure: SendItemName?
    typealias SendItemDetails = ([String]) -> ()
    var itemsDetailsClosure: SendItemDetails?
    
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
              let name = itemName.text
        else { return }
        
        guard itemDescrip != nil, itemQtyLabel != nil else { return }
        otherItemDetails.append("\(itemQtyLabel.text ?? "0")")
        otherItemDetails.append(itemDescrip.text!)
        itemsClosure?(name)
        itemsDetailsClosure?(otherItemDetails)
        
        dismiss(animated: true)
    }
}

extension SetItemViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryPickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryPickerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = categoryPickerArray[row]
        categoryTextField.resignFirstResponder()
    }
    
}

