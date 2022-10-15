//
//  QuoteListView.swift
//  Quote List Challenge
//
//  Created by Grant Christensen on 10/15/22.
//

import SwiftUI

struct QuoteListView: View {
    
    @ObservedObject var model = QuoteViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach (model.quotes, id: \.id) { quote in
                        NavigationLink {
                            QuoteDetailView(quote: quote)
                        } label: {
                            QuoteTile(quote: quote)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteListView()
    }
}

struct QuoteTile: View {
    
    var quote:Quote
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: quote.image)) { returnedImage in
                returnedImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 450)
                    .cornerRadius(16)
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
            } placeholder: {
                ProgressView()
            }
            
            VStack (alignment: .leading) {
                Text(quote.quotes[0])
                    .font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .frame(width: 350)
                    .shadow(color: .black, radius: 2, x: 1, y: 1)
                
                Text("- " + quote.author)
                    .font(.title3)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .frame(width: 300)
                    .padding(.top, 25)
                    .shadow(color: .black, radius: 2, x: 1, y: 1)
            }
        }
    }
}
