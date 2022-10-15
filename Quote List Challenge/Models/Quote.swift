//
//  Quote.swift
//  Quote List Challenge
//
//  Created by Grant Christensen on 10/15/22.
//

import Foundation

final class Quote: Identifiable, Decodable {
    
    var id:UUID?
    var author:String
    var image:String
    var quotes:[String]
    
}

