//
//  EditListButton.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 01/10/23.
//

import SwiftUI

struct EditListButton: View {
    @EnvironmentObject var appData : ApplicationData
    @State private var selectedRow : Set<BookViewModel.ID> = []
    @State var editActive : Bool = false
    var body: some View {
        VStack{
            HStack{
                Button(editActive ? "Done" : "Edit") {
                    editActive.toggle()
                }
                Spacer()
                Button(action: {
                    removeSelected()
                }, label: {
                    Image(systemName: "trash")
                }).disabled(selectedRow.count == 0 ? true : false)
            }.padding(10)
            List (selection: $selectedRow){
                ForEach(appData.userData){ book in
                    CellBook3(book: book)
                }
//                .onDelete(perform: { indexSet in
//                    appData.userData.remove(atOffsets: indexSet)
//                })
//                .onMove(perform: { indices, newOffset in
//                    appData.userData.move(fromOffsets: indices, toOffset: newOffset)
//                })
                
            }
            .listStyle(.plain)
            .refreshable {
                print("is loading")
            }
            .environment(\.editMode, .constant(editActive ? EditMode.active : EditMode.inactive))
    
        }
    }
    
    func removeSelected (){
        var indexes = IndexSet()
        for item in selectedRow {
            if let index = appData.userData.firstIndex(where: {$0.id == item}){
                indexes.insert(index)
            }
        }
        appData.userData.remove(atOffsets: indexes)
        selectedRow = []
        editActive = false
    }
}

#Preview {
    EditListButton()
        .environmentObject(ApplicationData())
}

struct CellBook3: View {
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
