//
//  ToolbarItemView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 02/10/23.
//

import SwiftUI

struct ToolbarItemView: View {
    @EnvironmentObject var appData: ApplicationData
    var body: some View {
        NavigationStack{
            List(appData.userData) { book in
                ToolbarView(book: book)
                    .listRowSeparator(.hidden)
            }
                        .listStyle(.plain)
            .navigationTitle("List Book")
            //            .toolbar(.hidden,for: .navigationBar)
            .toolbar(id : "mybar") {
                ToolbarItem(id: "sort", placement: .secondaryAction) {
                    Button(action: {
                        print("ShortBook")
                    }, label: {
                        Label("Sort Book", systemImage: "arrow.up.arrow.down")
                    })
                }
                ToolbarItem(id: "Setting", placement: .secondaryAction) {
                    Button(action: {
                        print("Setting Book")
                    }, label: {
                        Label("Setting", systemImage: "gearshape")
                    })
                }
            }.toolbarRole(.editor)
        }
    }
}

#Preview {
    Group{
        ToolbarItemView()
            .environmentObject(ApplicationData())
    }
}


struct ToolbarView: View {
    let book: BookViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            Image(book.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 100)
            VStack(alignment: .leading, spacing: 2) {
                Text(book.title).bold()
                Text(book.author)
                Text(book.year).font(.caption)
                Spacer()
            }.padding(.top, 5)
            Spacer()
        }
    }
}
