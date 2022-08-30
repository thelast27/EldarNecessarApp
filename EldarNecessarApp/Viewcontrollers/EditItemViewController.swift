//
//  EditItemViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 27.08.22.
//

import UIKit

class EditItemViewController: UIViewController {
    
    let categoryPickerView = UIPickerView()

    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemDescrip: UITextField!
    @IBOutlet weak var itemQty: UILabel!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var qtyItemStepper: UIStepper!
    
    private var categoryPickerArray: [String] = ["Outdoor", "Clothing", "Comfort & Entertaiment", "Documents", "Electronic & Gadget", "Family", "Medical & Health", "Toiletries", "Others"]
    var titleForTop = ""
    var items: ItemsForTrip?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titleForTop
        
        qtyItemStepper.wraps = false
        qtyItemStepper.autorepeat = true
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        categoryTextField.inputView = categoryPickerView
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let myItems = self.items {
            itemName.text = myItems.itemName
            itemDescrip.text = myItems.itemDescription
            itemQty.text = "\(myItems.itemQty)"
        }
    }
    
    
    @IBAction func qtyItemStepperAction(_ sender: UIStepper) {
            itemQty.text = Int(sender.value).description //есть баг, что степпер считает с нуля, даже если лейба изначально 1 или 5, счет будет с нуля. 
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
    }
}

extension EditItemViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
