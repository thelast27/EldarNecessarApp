//
//  TripListDataModel.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 10.08.22.
//

import Foundation
import UIKit

var tripsArray: [String] = []
var contentOfDerectory: [URL]!


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
