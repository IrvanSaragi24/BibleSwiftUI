//
//  FromViews.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 01/10/23.
//

import SwiftUI

struct FromViews: View {
    @State private var SetActive: Bool = false
    @State private var ShowPicture: Bool = false
    @State private var SetTotal: Int = 10
    var body: some View {
        Form{
            Section(header: Text("Options"), footer: Text("Activate your options & picture you want to see")) {
                Toggle("Active", isOn: $SetActive)
                Toggle("Show Picture", isOn: $ShowPicture)
            }
            Section(header: Text("Values"), footer: Text("Insert the number to see")) {
                HStack{
                    Text("Total")
                    Spacer()
                    Text(String(SetTotal))
                    Stepper("", value: $SetTotal, in: 0...10)
                        .labelsHidden()
                }

            }
                    }
    }
}

#Preview {
    FromViews()
}
