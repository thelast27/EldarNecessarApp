//
//  SetItemViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 16.08.22.
//

import UIKit


class SetItemViewController: UIViewController {
    
    //    let categoryPickerView = UIPickerView()
    
    @IBOutlet weak var itemQtyLabel: UILabel!
    @IBOutlet weak var qtyItemsStepper: UIStepper!
    //    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemDescrip: UITextField!
    @IBOutlet weak var backgroundView: UIImageView!
    
    
    //    private var categoryPickerArray: [String] = ["Outdoor", "Clothing", "Comfort & Entertaiment", "Documents", "Electronic & Gadget", "Family", "Medical & Health", "Toiletries", "Others"]
    
    typealias SendItemInfo = (ItemsForTrip) -> Void
    var itemsClosure: SendItemInfo?
    private var realmManager = RealmManager()
    var trips = Trips()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.image = UIImage(named: "backgroundPic")
        qtyItemsStepper.wraps = false
        qtyItemsStepper.autorepeat = true
        
        hideKeyboardWhenTappedAround()
        //        categoryPickerView.delegate = self
        //        categoryPickerView.dataSource = self
        //
        //        categoryTextField.inputView = categoryPickerView
        
    }
    
    
    @IBAction func qtyItemsStepperAction(_ sender: UIStepper) {
        sender.minimumValue = 1
        itemQtyLabel.text = Int(sender.value).description
        
    }
    
    @IBAction func cancelSetItem(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveItem(_ sender: Any) {
        
        guard itemName.hasText,
              let name = itemName.text
        else {
            UIView.animate(withDuration: 1) {
                self.itemName.backgroundColor = .red
            }
            UIView.animate(withDuration: 1.2) {
                self.itemName.backgroundColor = .systemGray4
            }
            return
        }
        
        guard let descr = itemDescrip.text, let qty = itemQtyLabel.text else { return }
        
        let items = ItemsForTrip()
        items.itemName = name
        items.itemDescription = descr
        if itemQtyLabel.text == "0" {
            items.itemQty = 1
        } else {
            items.itemQty = Int(qty) ?? 0
        }
        
        realmManager.writeItemDataToRealm(item: items, in: trips)
        
        itemsClosure?(items)
        
        dismiss(animated: true)
    }
}


//extension SetItemViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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

