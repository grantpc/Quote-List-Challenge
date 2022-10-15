//
//  QutoeViewModel.swift
//  Quote List Challenge
//
//  Created by Grant Christensen on 10/15/22.
//

import Foundation

class QuoteViewModel: ObservableObject {
    
    @Published var quotes = [Quote]()
    
    init() {
        self.quotes = DataService.getLocalData()
    }
}
