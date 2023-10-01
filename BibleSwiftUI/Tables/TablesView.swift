//
//  TablesView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 01/10/23.
//

import SwiftUI

struct TablesView: View {
    @EnvironmentObject var DataTable : DataListTables
    @State private var selectedItem : Set<ConsumableItem.ID> = []
    var body: some View {
        VStack{
            EditButton()
            Table(DataTable.listofItem, selection: $selectedItem){
                TableColumn("Name", value: \.name )
                TableColumn("Category", value: \.category )
                TableColumn("Calories"){ item in
                    Text("\(item.calories)")
                }.width(100)
            }
            Text(listSelected())
                .padding()
        }
    }
    func listSelected () -> String{
        let list : [String] = selectedItem.map({id in
            let item = DataTable.listofItem.first(where: {$0.id == id})
            return item?.name ?? ""
        })
        return String(list.sorted().joined(separator: ""))
    }
}

#Preview {
    TablesView()
        .environmentObject(DataListTables())
}
