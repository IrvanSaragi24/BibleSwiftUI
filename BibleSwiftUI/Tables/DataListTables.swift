//
//  DataListTables.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 01/10/23.
//

import SwiftUI

struct ConsumableItem : Identifiable {
    let id = UUID()
    var name : String
    var category : String
    var calories : Int
    var included : Bool
}

class DataListTables: ObservableObject{
    @Published var listofItem : [ConsumableItem]
    
    init(){
        listofItem = [
            ConsumableItem(name: "Bagels", category: "Baked", calories: 250, included: false),
            ConsumableItem(name: "Brownies", category: "Baked", calories: 466, included: false),
            ConsumableItem(name: "Butter", category: "Dairy", calories: 717, included: false),
            ConsumableItem(name: "Cheese", category: "Dairy", calories: 402, included: false),
            ConsumableItem(name: "Juice", category: "Beverages", calories: 23, included: false),
            ConsumableItem(name: "Lemonade", category: "Beverages", calories: 40, included: false)
        ]
    }
}
