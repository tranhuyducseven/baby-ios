//
//  CardModel.swift
//  MyApplication
//
//  Created by rosen on 26/09/2023.
//

import SwiftUI

struct ImageMap: Decodable {
    let image_url: String
    let image_path: String
    let image_url_full: String
}

struct CardItem: Decodable, Hashable {
    let uuid: String
    let title: String
    let description: String
    let content: String
    let image_map: [ImageMap]
    
    init(uuid: String, title: String, description: String, content: String, image_map: [ImageMap]) {
        self.uuid = uuid
        self.title = title
        self.description = description
        self.content = content
        self.image_map = image_map
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(uuid)
        }

        static func == (lhs: CardItem, rhs: CardItem) -> Bool {
            return lhs.uuid == rhs.uuid
            
        }
}


class CardListViewModel: ObservableObject{
    @Published var items: [CardItem] = []
    
    func fetchItems() {
        // Make a network request to your API here and decode the response
        // Replace the following example with your actual API request code.
        if let url = URL(string: "https://stock-api.f247.com/news?cate=&hot=false&offset=0&limit=30&with_content=true") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode([CardItem].self, from: data)
                                               
                        // Update your UI with the decoded data
                        DispatchQueue.main.async {
                            self.items = decodedData
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }.resume()
        }
    }
}


