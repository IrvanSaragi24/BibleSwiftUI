//
//  DetailView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 15/10/23.
//

import SwiftUI

struct DetailView: View {
    let book : BookViewModel
    @Binding var path : NavigationPath
    var body: some View {
        VStack {
           Text(book.title)
              .font(.title)
           Text(book.author)

           NavigationLink(value: "Picture View", label: {
              Image(book.cover)
                 .resizable()
                 .scaledToFit()
           })
        }.padding()
        .navigationTitle(Text("Book"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
           ToolbarItem(placement: .navigationBarLeading) {
              Button("Go Back") {
                 path.removeLast()
              }
           }
        }
        .navigationDestination(for: String.self, destination: { _ in
           PictureView(path: $path, book: book)
        })
    }
}

#Preview {
    NavigationStack{
        DetailView(book: ApplicationData().userData[0], path: .constant(NavigationPath()))
    }
}
