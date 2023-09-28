//
//  TextView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 18/09/23.
//

import SwiftUI

struct TextView: View {
    let number : Float = 20000
    let today = Date()
    var body: some View {
        
        VStack {
            Text("My Number  : \(number.formatted(.currency(code: "IDR")))")
            Text(today.formatted(date: .abbreviated, time: .omitted))
            
            Grid {
                GridRow{
                    Image(systemName: "message")
                        .frame(width: 100, height: 100)
                    Image(systemName: "mic")
                        .frame(width: 100, height: 100)
                }
                .background(.red)
                GridRow{
                    Image(systemName: "message")
                        .frame(width: 100, height: 100)
                    Image(systemName: "mic")
                        .frame(width: 100, height: 100)
                }
                .background(.blue)
            }
            .font(.title)
        }
        .padding()
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
