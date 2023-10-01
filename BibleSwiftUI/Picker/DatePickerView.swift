//
//  DatePickerView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 01/10/23.
//

import SwiftUI

struct DatePickerView: View {
//    @State private var selecData : Date = Date()
    @State private var selecDate: Set<DateComponents> = []
    @State private var myDate : String = "--"
    var body: some View {
        VStack{
//            DatePicker("Date", selection: $selecData, in: Date()..., displayedComponents: .date)
//                .labelsHidden()
//                .datePickerStyle(.graphical)
            MultiDatePicker("Dates", selection: $selecDate)
            Spacer()
            Text(myDate)
        }
        .padding()
        .onChange(of: selecDate) { values in
            let days = values.map({value in  String(value.day!) })
            myDate = days.joined(separator: ",")
        }
    }
}

#Preview {
    DatePickerView()
}
