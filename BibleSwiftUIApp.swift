//
//  BibleSwiftUIApp.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 17/09/23.
//

import SwiftUI

@main
struct BibleSwiftUIApp: App {
    @StateObject var appData = AplicationData()
    var body: some Scene {
        WindowGroup {
            MVVMview(dataApp: appData)
        }
    }
}
