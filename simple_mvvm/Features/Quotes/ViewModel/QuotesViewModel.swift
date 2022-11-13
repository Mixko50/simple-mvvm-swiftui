//
//  QuotesViewModel.swift
//  simple_mvvm
//
//  Created by Mixko on 11/13/22.
//

import Foundation

protocol QuotesViewModel: ObservableObject {
    func getRandomQuotes() async
}

@MainActor // runs on main thread (Update UI)
final class QuotesViewModelImpl: QuotesViewModel {
    @Published private (set) var quotes: [Quote] = []
    // (set) change this array only in this scope, we can access from the outside but, can not change from the outside.
    
    private let service: QuoteService
    
    init(service: QuoteService) {
        self.service = service
    }
    
    func getRandomQuotes() async {
        do {
            self.quotes = try await service.fetchRandomQuotes()
        } catch {
            print(error)
        }
    }
}
