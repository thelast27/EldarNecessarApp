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
    
}


class ItemsForTrip: Object {
    @Persisted var itemName: String = ""
    @Persisted var itemDescription: String = ""
    @Persisted var itemQty: Int = 0
}
