//
//  OutlineListView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 01/10/23.
//

import SwiftUI

struct MainItems : Identifiable{
    var id = UUID()
    var nama : String!
    var options : [MainItems]!
}

class ContentViewData : ObservableObject {
    @Published var items : [MainItems]
    
    init() {
        items = [
            MainItems(nama : "Food" ,options: [
                MainItems(nama: "Oatmeal" ,options: nil),
                MainItems(nama: "Nasi Goreng", options: [
                    MainItems(nama: "N Goreng Ayam", options: nil),
                    MainItems(nama: "N Goreng Bebek", options: nil),
                ]),
            ]),
            MainItems(nama: "Fruit", options: [
                MainItems(nama: "Teh Obeng", options: nil),
                MainItems(nama: "Teh Tarek", options: nil),
            ])
        ]
    }
}

struct OutlineListView: View {
    @ObservedObject var contenData = ContentViewData()
    var body: some View {
        VStack{
            List(contenData.items, children: \.options){ item in
                Text(item.nama)
            }
            .listStyle(.sidebar)
        }
    }
}

#Preview {
    OutlineListView()
}
