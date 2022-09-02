//
//  RealmModel.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 25.08.22.
//

import Foundation
import RealmSwift

class Trips: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var tripName: String = ""
    @Persisted var tripNotes: String = ""
    @Persisted var items = List<ItemsForTrip>()
    @Persisted var long: Double = 0.0
    @Persisted var lat: Double = 0.0
    @Persisted var coordinatesAvailable: Bool = false
    
}


class ItemsForTrip: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var itemName: String = ""
    @Persisted var itemDescription: String = ""
    @Persisted var itemQty: Int = 0
    @Persisted var isPacked: Bool = false
}
