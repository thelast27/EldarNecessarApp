//
//  EditItemViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 27.08.22.
//

import UIKit

class EditItemViewController: UIViewController {
    
//    let categoryPickerView = UIPickerView()
    
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemDescrip: UITextField!
    @IBOutlet weak var itemQty: UILabel!
//    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var qtyItemStepper: UIStepper!
    @IBOutlet weak var backgroundView: UIImageView!
    
//    private var categoryPickerArray: [String] = ["Outdoor", "Clothing", "Comfort & Entertaiment", "Documents", "Electronic & Gadget", "Family", "Medical & Health", "Toiletries", "Others"]
    var titleForTop = ""
    var items: ItemsForTrip?
    var trips: Trips?
    private var realmManager = RealmManager()
    private var updatedItem = ItemsForTrip()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.image = UIImage(named: "backgroundPic")
        
        title = titleForTop
        
        qtyItemStepper.wraps = false
        qtyItemStepper.autorepeat = true
        
        if let myItems = self.items {
            itemQty.text = "\(myItems.itemQty)"
            qtyItemStepper.value = Double(myItems.itemQty)
        }
//        categoryPickerView.delegate = self
//        categoryPickerView.dataSource = self
//        categoryTextField.inputView = categoryPickerView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let myItems = self.items {
            itemName.text = myItems.itemName
            itemDescrip.text = myItems.itemDescription
        }
    }
    
    
    @IBAction func qtyItemStepperAction(_ sender: UIStepper) {
        sender.minimumValue = 1
        itemQty.text = Int(sender.value).description
    }
    
    @IBAction func saveEditedItem(_ sender: Any) {
        
        guard let name = itemName.text,
              let trip = trips,
              let qty = Int(itemQty.text ?? ""),
              let descr = itemDescrip.text,
              let items = items
        else { return }
        
        if itemName.hasText == true {
            updatedItem.itemName = name
        }
        
        updatedItem.itemDescription = descr
        updatedItem.itemQty = qty
        realmManager.editItem(item: items, in: trip, updatedItems: updatedItem) {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        guard let items = items, let trip = trips else { return }
        let alertController = UIAlertController(title: "Attention!", message: "Delete item?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak self] alert in
            self?.realmManager.deleteITemFromTrip(item: items, from: trip) {
                self?.navigationController?.popViewController(animated: true)
            }
        }))
        alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: { [weak self] alert in
            self?.dismiss(animated: true)
        }))
       present(alertController, animated: true)
    }
    
    @IBAction func cancelEditing(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

//extension EditItemViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return categoryPickerArray.count
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return categoryPickerArray[row]
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        categoryTextField.text = categoryPickerArray[row]
//        categoryTextField.resignFirstResponder()
//    }
//    
//}
