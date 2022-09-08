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
    @IBOutlet weak var saveTripButton: UIButton!
    
    typealias SendTripsDataClosure = (Trips) -> Void
    var tripsClosure: SendTripsDataClosure?
    private var realmManager = RealmManager()
    private var duration: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        viewForBackground.image = UIImage(named: "backgroundPic")
    }
    
    
    @IBAction func saveSetTrip(_ sender: Any) {
        guard tripName.hasText,
              let textForCell = tripName.text
        else {
            UIView.animate(withDuration: 1) {
                self.tripName.backgroundColor = .red
            }
            UIView.animate(withDuration: 1.2) {
                self.tripName.backgroundColor = .systemGray4
            }
            return
        }
        guard let tripNotes = tripNotes.text else { return }
        let trip = Trips()
        trip.tripName = textForCell
        trip.tripNotes = tripNotes
        trip.tripDuration = duration
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
        guard let durationInDays = Calendar.current.dateComponents([.day], from: durationFromDepartureDate, to: durationFromReturnDate).day else { return }
        duration = durationInDays
        durationLabel.isHidden = false
        
        if durationInDays < 0 {
            UIView.animate(withDuration: 1) {
                self.returnDate.backgroundColor = .red
            }
            UIView.animate(withDuration: 1.5) {
                self.returnDate.backgroundColor = .none
            }
            durationLabel.textColor = .red
            durationLabel.text = "Return date is earlier than departure!"
            saveTripButton.isEnabled = false
        } else {
            durationLabel.textColor = .black
            durationLabel.text = "Trip for \(durationInDays) day(s)"
            saveTripButton.isEnabled = true
        }
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


