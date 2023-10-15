//
//  NavigationLinkView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 15/10/23.
//

import SwiftUI

struct NavigationLinkView: View {
    @EnvironmentObject var appData: ApplicationData
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack{
            List(appData.userData) { book in
                NavigationLink(destination: DetailView(book: book, path: $path)) {
                    ToolbarView2(book: book)
                        .listRowSeparator(.hidden)
                }
            }
                        .listStyle(.plain)
            .navigationTitle("List Book")
            .navigationDestination(for: BookViewModel.self, destination: { book in
                DetailView(book: book, path: $path)
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: settingView()) {
                        Image(systemName: "gearshape")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationLinkView()
        .environmentObject(ApplicationData())
}

struct ToolbarView2: View {
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
