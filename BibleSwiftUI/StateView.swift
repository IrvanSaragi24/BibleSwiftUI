//
//  PropertyWrpapper.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 18/09/23.
//

import SwiftUI

struct StateView: View {
    @State var MyTitle : String = "My Title"
    var body: some View {
        VStack{
            Text("\(MyTitle)")
            Button {
                MyTitle = "My New Title"
            } label: {
                Text("Change Title")
            }
        }

    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
