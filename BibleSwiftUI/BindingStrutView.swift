//
//  BindingStrutView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 18/09/23.
//

import SwiftUI

struct BindingStrutView: View {
    @State var title : String = "Default title"
    @State var titleInput : String = ""
    @State var counter : Int = 0
    
    init() {
        _titleInput = State(initialValue: "Hello World")
    }
    var body: some View {
        VStack{
            ExtractedView1(title: $title)
            TextField("Insert Title", text: _titleInput.projectedValue)
                .padding(10)
                .textFieldStyle(.roundedBorder)
            Button {
                _title.wrappedValue = _titleInput.wrappedValue
                _titleInput.wrappedValue = ""
                counter += 1
                
            } label: {
                Text("Change Title")
            }

        }
    }
}

struct BindingStrutView_Previews: PreviewProvider {
    
    static var previews: some View {
        BindingStrutView()
        ExtractedView1(title: .constant("my priview title"))
    }
}

struct ExtractedView1: View {
    
    @Binding var title : String
    let counter : Int
    
    init(title : Binding<String>) {
        _title = title
        
        let sentence = _title.wrappedValue
        counter = sentence.count
    }
    var body: some View {
        Text("\(_title.wrappedValue)(\(counter))")
            .padding(10)
    }
}
