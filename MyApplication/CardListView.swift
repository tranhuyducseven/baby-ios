//
//  ContentView.swift
//  MyApplication
//
//  Created by rosen on 25/09/2023.
//

import SwiftUI
import UIKit

struct CardListView: View {
    @ObservedObject var viewModel = CardListViewModel()
    @State private var selectedCard: CardItem? = nil
    
    var body: some View {
        NavigationView{
            List(viewModel.items, id: \.uuid){card in
                NavigationLink(destination: DetailView(card: card), tag: card, selection: $selectedCard) {
                    HStack {
                        AsyncImage(url: URL(string: card.image_map[0].image_url)){
                            image in image
                                .resizable()
                                .scaledToFit()
                                .frame(width:120, height: 80)
                                .cornerRadius(8)
                                .padding(.vertical, 8)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Text(card.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .lineLimit(3)
                            .minimumScaleFactor(0.8)
                    }
                }
                
            }
            
            .padding(-18.0).onAppear {
                // Fetch items when the view appears
                viewModel.fetchItems()
            }
        }.navigationTitle("List of card")
    }
}

#Preview {
    CardListView()
}
