//
//  settingView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 15/10/23.
//

import SwiftUI

struct settingView: View {
    @Environment(\.dismiss) var dismiss
    @State var showPictures : Bool = true
    @State var showYear : Bool = true
    var body: some View {
        Form{
            Toggle("Show Picture", isOn: $showPictures)
            Toggle("Show Year", isOn: $showYear)
        }
        .navigationTitle("Setting")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Go Back")
                })
            }
        }
        
    }
}

#Preview {
    NavigationStack{
        settingView()
    }
}
