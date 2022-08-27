//
//  EditItemViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 27.08.22.
//

import UIKit

class EditItemViewController: UIViewController {
    
    let categoryPickerView = UIPickerView()

    @IBOutlet weak var categoryTextField: UITextField!
    
    private var categoryPickerArray: [String] = ["Outdoor", "Clothing", "Comfort & Entertaiment", "Documents", "Electronic & Gadget", "Family", "Medical & Health", "Toiletries", "Others"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        categoryTextField.inputView = categoryPickerView
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
