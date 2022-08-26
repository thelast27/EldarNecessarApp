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
    
     init() {}
    
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
