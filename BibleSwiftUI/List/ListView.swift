//
//  ListView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 30/09/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var appData: ApplicationData
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "book.circle")
                    .font(.largeTitle)
                Spacer()
                Text("My Favorite Book")
                    .font(.headline)
            }
            .frame(height: 50)
            .padding(10)
            List(appData.userData) { book in
               CellBook(book: book)
//                    .listRowBackground(Color(white : 0.8))
                    .listRowSeparator(.hidden)
            }.listStyle(.plain)
            
        }
    }
 }

#Preview {
    Group{
        ListView().environmentObject(ApplicationData())
    }
}


struct CellBook: View {
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
