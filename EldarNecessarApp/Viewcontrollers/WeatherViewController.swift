//
//  WeatherViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 5.09.22.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.register(UINib(nibName: "CurrentWeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrentWeatherCell")
    }
    



}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentWeatherCell", for: indexPath) as? CurrentWeatherTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    
 
    
    
}
