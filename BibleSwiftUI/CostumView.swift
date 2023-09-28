//
//  CostumView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 18/09/23.
//

import SwiftUI

struct CostumView: View {
    var body: some View {
        getView()
    }
    @ViewBuilder
    func getView()-> some View{
        let valid = true
        if valid{
            Image(systemName: "keyboard")
        } else {
            Text("Irvan")
        }
    }
}

struct CostumView_Previews: PreviewProvider {
    static var previews: some View {
        CostumView()
    }
}
