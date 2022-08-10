//
//  TripListDataModel.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 10.08.22.
//

import Foundation

var tripsArray: [String] = ["Поход в горы", "Поездка на речку"]

func addItem(name: String) {
    tripsArray.append(name)
    saveItem()
}


func removeItem(at index: Int ) {
    tripsArray.remove(at: index)
    saveItem()
}

func saveItem() {
    
}
