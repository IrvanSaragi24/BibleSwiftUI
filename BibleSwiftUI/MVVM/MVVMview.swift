//
//  MVVMview.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 20/09/23.
//

import SwiftUI

struct MVVMview: View {
    @ObservedObject var dataApp : AplicationData
    var body: some View {
        VStack{
            Text(dataApp.title)
                .padding(10)
            TextField("InsertData", text: $dataApp.titleInput)
                .padding(10)
                .textFieldStyle(.roundedBorder)
            Button {
                dataApp.title = dataApp.titleInput
            } label: {
                Text("Save")
            }

        }
    }
}

struct MVVMview_Previews: PreviewProvider {
    static var previews: some View {
        MVVMview(dataApp: AplicationData())
    }
}
