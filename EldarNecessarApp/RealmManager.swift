//
//  RealmManager.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 25.08.22.
//

import Foundation
import RealmSwift



class RealmManager {
    let realm = try! Realm()
    
    func writeTripDataToRealm(data: Trips) {
        try! self.realm.write {
            self.realm.add(data)
        }
    }
    
    func writeItemDataToRealm(data: ItemsForTrip) {
        try! self.realm.write {
            self.realm.add(data)
        }
    }
    
    func getTripDataFromRealm() -> Results<Trips> {
        return realm.objects(Trips.self)
    }
    
    func getItemDataFromRealm() -> Results<ItemsForTrip> {
        return realm.objects(ItemsForTrip.self)
    }
    
    func deleteTripFromRealm(data: Trips) {
        try! realm.write {
            realm.delete(data)
        }
    }
    
}
