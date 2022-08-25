//
//  SetItemViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 16.08.22.
//

import UIKit
import RealmSwift



class SetItemViewController: UIViewController {
    
    let categoryPickerView = UIPickerView()
    
    @IBOutlet weak var itemQtyLabel: UILabel!
    @IBOutlet weak var qtyItemsStepper: UIStepper!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemDescrip: UITextField!
    
    
    private var categoryPickerArray: [String] = ["Outdoor", "Clothing", "Comfort & Entertaiment", "Documents", "Electronic & Gadget", "Family", "Medical & Health", "Toiletries", "Others"]
    var otherItemDetails: [String] = []
    typealias SendItemInfo = (ItemsForTrip) -> ()
    var itemsClosure: SendItemInfo?
    typealias SendItemDetails = ([String]) -> ()
    var itemsDetailsClosure: SendItemDetails?
    var realmManager = RealmManager()
    
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
        
        guard let descr = itemDescrip.text, let qty = itemQtyLabel.text else { return }
        otherItemDetails.append(descr)
        otherItemDetails.append(qty)
        let items = ItemsForTrip()
        items.itemName = name
        items.itemDescription = descr
        items.itemQty = Int(qty)!
        realmManager.writeItemDataToRealm(data: items)
        itemsClosure?(items)
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

