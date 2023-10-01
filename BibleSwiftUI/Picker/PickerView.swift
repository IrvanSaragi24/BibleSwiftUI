//
//  PickerView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 01/10/23.
//

import SwiftUI

struct PickerView: View {
    @State private var ValuePicker : String = "No Value"
    let listCity : [String] = ["Medan", "Jakarta", "Bali"]
    var body: some View {
        VStack{
            Text(ValuePicker)
                .font(.headline)
            Picker("Cities", selection: $ValuePicker) {
                ForEach(listCity, id: \.self) { value in
                    Text(value)
                }
            }.pickerStyle(.segmented)
            Spacer()
        }
    }
}

#Preview {
    PickerView()
}
