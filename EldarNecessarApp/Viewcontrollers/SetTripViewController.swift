//
//  SetTripViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 10.08.22.
//

import UIKit


class SetTripViewController: UIViewController {
    
    let fileManager = FileManager.default
    
    @IBOutlet weak var tripName: UITextField!
    @IBOutlet weak var tripNotes: UITextField!
    @IBOutlet weak var departureDate: UIDatePicker!
    @IBOutlet weak var returnDate: UIDatePicker!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var viewForBackground: UIImageView!
    
    typealias SendTripsDataClosure = (Trips) -> Void
    var tripsClosure: SendTripsDataClosure?
    private var realmManager = RealmManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        viewForBackground.image = UIImage(named: "backgroundPic")
    }
    
    
    @IBAction func saveSetTrip(_ sender: Any) {
        guard tripName.hasText,
              let textForCell = tripName.text
        else { return }
        guard let tripNotes = tripNotes.text else { return }
        let trip = Trips()
        trip.tripName = textForCell
        trip.tripNotes = tripNotes
        realmManager.writeTripDataToRealm(data: trip)
        tripsClosure?(trip)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func getDateFromPicker(_ sender: Any) {
        durationCalculation()
    }
    @IBAction func returnDate(_ sender: Any) {
        durationCalculation()
    }
    
    
    fileprivate func durationCalculation() {
        
        let durationFromDepartureDate = departureDate.calendar.dateComponents([.day, .month, .year], from: departureDate.date)
        let durationFromReturnDate = returnDate.calendar.dateComponents([.day, .month, .year], from: returnDate.date)
        let durationInDays = durationFromReturnDate.day! - durationFromDepartureDate.day!
        durationLabel.isHidden = false
        durationLabel.text = "Trip for \(durationInDays) day(s)"
        view.layoutIfNeeded()
        
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


