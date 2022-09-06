//
//  TabBarViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 30.08.22.
//

import Foundation
import UIKit

class TabBarViewControoller: UITabBarController {
    
    override func viewDidLoad() {
        guard let weatherViewContoller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TripListViewController") as? StartTripListViewController
        else { return }
        
        viewControllers = [addViewController(viewController: UINavigationController(rootViewController: weatherViewContoller), title: "Trips", image: UIImage(systemName: "airplane.departure"))]
    }
    
    
    private func addViewController(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
        
    }
    
}
