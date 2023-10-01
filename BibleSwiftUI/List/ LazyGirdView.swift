//
//  LazyGirdView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 30/09/23.
//

import SwiftUI

struct LazyGirdView: View {
    @EnvironmentObject var appData : ApplicationData
    let guides = [
        GridItem(.flexible(minimum: 75)),
        GridItem(.flexible(minimum: 75)),
        GridItem(.flexible(minimum: 75))
    ]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: guides){
                ForEach(appData.userData){ book in
                    Image("\(book.cover)")
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}

#Preview {
        LazyGirdView()
            .environmentObject(ApplicationData())
//            .previewInterfaceOrientation(.portrait)
}

