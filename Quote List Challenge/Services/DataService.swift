//
//  DataService.swift
//  Recipe List App
//
//  Created by Grant Christensen on 10/14/22.
//

import Foundation

class DataService {
    
    // static allows you to call it directly without creating an instance of DataService
    static func getLocalData() -> [Quote] {
        
        // Parse local JSON file
        
        // Get a url path to the JSON file
        let pathString = Bundle.main.path(forResource: "quotes", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Quote]()
        }
        
        // Create a url object
        let url = URL(filePath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            let quoteData = try decoder.decode([Quote].self, from: data)
            
            // Add unique IDs
            for r in quoteData {
                r.id = UUID()
            }
            
            // Return data to viewModel
            return quoteData
        }
        catch {
            // Error handling
            print(error)
        }
        
        // returning empty array of recipes in case decoder fails
        return [Quote]()
    }
}
