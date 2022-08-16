//
//  ItemsViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 16.08.22.
//

import UIKit

class ItemsViewController: UIViewController {
    
    
    var arrayWithItems: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemAction))
    }
    

    @objc func addItemAction(_ sender: Any) {
        let viewController = UIStoryboard(name: "ItemsList", bundle: nil)
        if let VC = viewController.instantiateViewController(withIdentifier: "SetItemVC") as? SetItemViewController {
            VC.itemsClosure = { [ weak self ] items in
                self?.arrayWithItems = items
//                self?.tripListTableView.reloadData()
            }
        let navigationVC = UINavigationController(rootViewController: VC)
        present(navigationVC, animated: true)
    }
     
}
}
