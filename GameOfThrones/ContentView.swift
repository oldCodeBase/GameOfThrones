//
//  ContentView.swift
//  GameOfThrones
//
//  Created by Ibragim Akaev on 10/01/2021.
//

import SwiftUI
import URLImage

struct ContentView: View {
    @State var urlString = "https://thronesapi.com/api/v2/Characters"
    @State var characters: [Character] = []
    
    var body: some View {
        NavigationView {
            List(characters) { character in
                HStack {
                    URLImage(url: URL(string: character.imageUrl)!,
                             content: { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipped()
                                    .cornerRadius(40)
                             })
                    VStack(alignment: .leading, spacing: 8) {
                        Text(character.fullName)
                            .font(.headline)
                            .font(.system(size: 20, weight: .medium))
                        Text(character.title)
                            .font(.subheadline)
                        
                        Text(character.family)
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .opacity(0.7)
                        
                    }.padding(.horizontal, 8)
                    .lineLimit(2)
                    
                }.padding([.top, .leading, .bottom], 8.0)
                
            }.listStyle(InsetGroupedListStyle())
            .onAppear() {
                NetworkService.shared.fetchData(from: urlString) { (characters) in
                    self.characters = characters
                }
            }.navigationTitle("Game of Thrones")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
