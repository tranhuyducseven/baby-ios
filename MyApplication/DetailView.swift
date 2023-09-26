//
//  ContentView.swift
//  MyApplication
//
//  Created by rosen on 25/09/2023.
//

import WebKit
import SwiftUI





struct DetailView: View {
    let card: CardItem
    
    var body: some View {
        
        ScrollView {
            
            Text(card.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 32))
            
            Text(card.description)
                .fontWeight(.semibold)
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.top, 4)
            
            
            AsyncImage(url: URL(string: card.image_map[0].image_url)){
                image in image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(8)
                
                
            } placeholder: {
                ProgressView()
            }
            
            HTMLStringView(htmlContent: "<h1>This is HTML String</h1>")
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity).padding(.horizontal, 12)
        
  
    }
}
