//
//  QuoteDetailView.swift
//  Quote List Challenge
//
//  Created by Grant Christensen on 10/15/22.
//

import SwiftUI

struct QuoteDetailView: View {
    
    var quote:Quote
    
    var body: some View {
        VStack (alignment: .leading) {
            Spacer()
            
            Text(quote.author)
                .font(.title)
                .multilineTextAlignment(.leading)
            
            ForEach (quote.quotes, id: \.self) { quote in
                Text(quote)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 15)
            }
            
            Spacer()
            Spacer()
        }.padding(.horizontal)
    }
}

struct QuoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = QuoteViewModel()
        
        QuoteDetailView(quote: model.quotes[0])
    }
}
