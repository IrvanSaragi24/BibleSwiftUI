//
//  EnvironmentView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 18/09/23.
//

import SwiftUI

struct EnvironmentView: View {
    @Environment(\.colorScheme) var mode
    var body: some View {
        Image(systemName: "trash")
            .font(.system(size: 100))
            .foregroundColor(mode == .light ? Color.yellow : Color.pink)
            .symbolVariant(mode == .light ? .fill: .circle)
    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView()
    }
}
