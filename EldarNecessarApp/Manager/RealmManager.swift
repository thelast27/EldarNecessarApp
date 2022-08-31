//
//  RealmManager.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 25.08.22.
//

import Foundation
import RealmSwift



class RealmManager {
    
    private let realmSchemaVersion: UInt64 = 2
    
    typealias completionHandler = () -> Void
    
    
lazy var realm: Realm = {
        let config = Realm.Configuration(schemaVersion: realmSchemaVersion)
        Realm.Configuration.defaultConfiguration = config
        
        return try! Realm()
    }()
    
    func writeTripDataToRealm(data: Trips) {
        try! self.realm.write {
            self.realm.add(data)
        }
    }
    
    func writeItemDataToRealm(item: ItemsForTrip, in trip: Trips) {
     try! realm.write {
         trip.items.append(item)
        }
    }
    
    func writeItemIsPackedDataToRealm(item: ItemsForTrip, in trip: Trips) {
        try! realm.write({
            item.isPacked.toggle()
        })
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
    
    func deleteITemFromTrip(item: ItemsForTrip, from trip: Trips, completion: completionHandler) {
        try! realm.write {
            trip.items.realm?.delete(item)
        }
        completion()
    }
    
    func editItem(item: ItemsForTrip, in trip: Trips, updatedItems: ItemsForTrip, completion: completionHandler) {
        try! realm.write {
            trip.items.realm?.delete(item)
            trip.items.append(updatedItems)
        }
        completion()
    }
    
}
