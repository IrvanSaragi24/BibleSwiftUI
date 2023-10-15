//
//  PictureView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 15/10/23.
//

import SwiftUI

struct PictureView: View {
   @Binding var path: NavigationPath
   let book: BookViewModel

   var body: some View {
      VStack {
         Image(book.cover)
            .resizable()
            .scaledToFit()
         Spacer()
      }
      .navigationTitle(Text("Cover"))
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden()
      .toolbar {
         ToolbarItem(placement: .navigationBarLeading) {
            Button("Go Back") {
               path.removeLast()
            }
         }
         ToolbarItem(placement: .navigationBarTrailing) {
            Button("Back to List") {
               path = NavigationPath()
            }
         }
      }
   }
}

#Preview {
    NavigationStack {
       PictureView(path: .constant(NavigationPath()), book: ApplicationData().userData[0])
    }
}
