//
//  Grocery.swift
//  CTPickerSwiftUI
//
//  Created by Ramill Ibragimov on 26.08.2020.
//

import SwiftUI

struct Grocery: Identifiable, Codable {
    enum Category: String, Codable {
        case food, beverage
    }
    
    var id: UUID = UUID()
    var name: String
    var category: Category
}
