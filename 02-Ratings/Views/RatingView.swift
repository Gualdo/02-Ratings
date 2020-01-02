//
//  RatingView.swift
//  02-Ratings
//
//  Created by De La Cruz, Eduardo on 31/12/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var vgStore: VideogameStore
    
    @State var videogame: Videogame
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading) {
                    SectionTitle(title: "Titulo")
                    TextField("", text: $videogame.title)
                }
            }
            
            Section {
                VStack(alignment: .leading) {
                    SectionTitle(title: "Valoracion")
                    HStack {
                        Spacer()
                        Text(String(repeating: "⭐️", count: Int(videogame.rating)))
                            .font(.title)
                        Spacer()
                    }
                    Slider(value: $videogame.rating, in: 0...5, step: 1)
                }
            }
            
            Section {
                Toggle(isOn: $videogame.played) {
                    if videogame.title == "" {
                        SectionTitle(title: "Has jugado")
                    } else {
                        SectionTitle(title: "Has jugado a \(videogame.title)")
                    }
                }
            }
            
            Section {
                Button(action: {
                    if self.vgStore.videogames.contains(where: { videogame in
                        return videogame.id == self.videogame.id
                    }) {
                        self.vgStore.updateVideogame(videogame: self.videogame)
                    } else {
                        self.vgStore.addVideogame(videogame: self.videogame)
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Spacer()
                        SectionTitle(title: "Guardar")
                        Spacer()
                    }
                }
            }
            }.listStyle(GroupedListStyle()).navigationBarTitle("Game Detail")
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(vgStore: VideogameStore(), videogame: Videogame())
    }
}

struct SectionTitle: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.gray)
            .font(.subheadline)
    }
}

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle(title: "Title")
    }
}
