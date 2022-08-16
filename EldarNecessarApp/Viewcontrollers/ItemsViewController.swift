//
//  ItemsViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 16.08.22.
//

import UIKit

class ItemsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemAction))
    }
    

    @objc func addItemAction(_ sender: Any) {
        let viewController = UIStoryboard(name: "ItemsList", bundle: nil)
        if let VC = viewController.instantiateViewController(withIdentifier: "SetItemVC") as? SetItemViewController {
        let navigationVC = UINavigationController(rootViewController: VC)
        present(navigationVC, animated: true)
    }
     
}
}
