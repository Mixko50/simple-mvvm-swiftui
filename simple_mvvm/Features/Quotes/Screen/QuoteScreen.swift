//
//  QuoteScreen.swift
//  simple_mvvm
//
//  Created by Mixko on 11/13/22.
//

import SwiftUI

struct QuoteScreen: View {
    
    @StateObject private var vm = QuotesViewModelImpl(service: QuotesServiceImpl())
    
    var body: some View {
        NavigationView {
            Group {
                if vm.quotes.isEmpty {
                   LoadingView(text: "Fetching Quotes")
                } else {
                    List {
                        ForEach(vm.quotes, id: \.anime) { item in
                            QuoteView(item: item)
                        }
                    }.navigationTitle("Quotes")
                }
            }.task {
                await vm.getRandomQuotes()
            }
        }
    }
}

struct QuoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuoteScreen()
    }
}
