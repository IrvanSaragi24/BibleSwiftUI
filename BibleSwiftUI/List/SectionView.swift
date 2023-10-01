//
//  SectionView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 01/10/23.
//

import SwiftUI

struct SectionView: View {
    @EnvironmentObject var appData: ApplicationData
    
    var orderlist : [(key : String, value : [BookViewModel])]{
        let listgroup : [String: [BookViewModel]] = Dictionary(grouping: appData.userData, by: { value in
            let index = value.title.startIndex
            let initial = value.title[index]
            return String(initial)
        })
        return listgroup.sorted(by: {$0.key < $1.key})
    }
    
    var body: some View {
        NavigationView{
            VStack{
                EditButton()
                List {
                    ForEach (orderlist, id : \.key){ sections in
                        Section (header : Text(sections.key)){
                            ForEach (sections.value){ book in
                                CellBook2(book: book)
                            }
                            .onDelete(perform: { indexSet in
                                appData.userData.remove(atOffsets: indexSet)
                            })
                            .onMove(perform: { indices, newOffset in
                                appData.userData.move(fromOffsets: indices, toOffset: newOffset)
                            })
                            
                        }.headerProminence(.increased)
                    }
    //                Section(header: Text("Stattistic")) {
    //                    HStack{
    //                        Text("Total Books : ")
    //                        Spacer()
    //                        Text(String(appData.userData.count))
    //                    }
    //                }
    ////                .headerProminence(.increased)
    //                .listSectionSeparator(.hidden, edges: .top)
    //                .listSectionSeparatorTint(.blue)
                    
    //                Section(header : Text("Books")){
    //                    ForEach(orderlist, id: \.key) { book in
    //                        VStack(alignment : .leading){
    //                            HStack(alignment : .top){
    //                                Image("\(book.cover)")
    //                                    .resizable()
    //                                    .frame(width: 80, height: 100)
    //                                VStack(alignment : .leading){
    //                                    Text(book.title)
    //                                        .font(.headline)
    //                                    Text(book.author)
    //                                    Text(book.year)
    //                                        .font(.caption)
    //                                }.padding(5)
    //
    //                            }
    //
    //                        }
    //                    }
    //
    //                }.headerProminence(.increased)
                }.listStyle(.plain)
            }
//            .navigationTitle("Books")
        }
    }
}

#Preview {
    SectionView()
        .environmentObject(ApplicationData())
}

struct CellBook2: View {
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
