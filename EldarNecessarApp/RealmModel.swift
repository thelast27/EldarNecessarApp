//
//  RealmModel.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 25.08.22.
//

import Foundation
import RealmSwift

class Trips: Object {
    @objc dynamic var tripName = ""
    @objc dynamic var tripNotes = ""
}


class ItemsForTrip: Object {
    @objc dynamic var itemName: String = ""
    @objc dynamic var itemDescription: String = ""
    @objc dynamic var itemQty: Int = 0
}
