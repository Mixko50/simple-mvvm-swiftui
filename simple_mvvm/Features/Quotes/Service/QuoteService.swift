//
//  QuoteService.swift
//  simple_mvvm
//
//  Created by Mixko on 11/13/22.
//

import Foundation

protocol QuoteService {
    func fetchRandomQuotes() async throws -> [Quote]
}

final class QuotesServiceImpl: QuoteService {
    func fetchRandomQuotes() async throws -> [Quote] {
        let urlSesssion = URLSession.shared
        let url = URL(string: APIConstants.baseUrl.appending("/api/quotes"))
        let (data,_) = try await urlSesssion.data(from: url!)
        return try JSONDecoder().decode([Quote].self, from: data)
    }
}
