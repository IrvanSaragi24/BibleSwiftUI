//
//  BindingView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 18/09/23.
//

import SwiftUI

struct BindingView: View {
    @State var MyTitle : String = "Title"
    var body: some View {
        VStack{
            ExtractedView(MyTitle: $MyTitle)
            Button {
                MyTitle = "New Title"
            } label: {
                Text("Change Title")
            }
        }
    }
}

struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView()
    }
}

struct ExtractedView: View {
    @Binding var MyTitle : String
    var body: some View {
        Text("\(MyTitle)")
    }
}
