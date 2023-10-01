//
//  ListForEachView.swift
//  BibleSwiftUI
//
//  Created by Irvan P. Saragi on 28/09/23.
//

import SwiftUI

struct ListForEachView: View {
    @EnvironmentObject var appData : ApplicationData
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                        VStack(alignment: .leading){
                            ForEach(appData.userData) { book in
                                VStack{
                                    HStack(alignment : .top){
                                        Image("\(book.cover)")
                                            .resizable()
                                            .frame(width: 80, height: 100)
                                        VStack(alignment : .leading, spacing: 2){
                                            Text(book.title)
                                                .fontWeight(.bold)
                                            Text(book.author)
                                            Text(book.year)
                                                .font(.caption)
                                        }
                                        .padding(.top, 5)
                                    }
                                    
                                }
                                Divider()
                            }
                        }
                        .padding()
                        .navigationTitle("List Buku")
                    
                }
            }
        }
     
    }
}

#Preview {
    ListForEachView()
        .environmentObject(ApplicationData())
}
