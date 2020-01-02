//
//  VideogamesList.swift
//  02-Ratings
//
//  Created by De La Cruz, Eduardo on 31/12/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import SwiftUI

struct VideogamesList: View {
    
    @ObservedObject var vgStore = VideogameStore()
    
    @State var isPresented = false
    
    var body: some View {
        NavigationView {
            List {
                Button(action: {
                    self.isPresented.toggle()
                }) {
                    Text("Añadir juego").foregroundColor(.blue)
                }
                ForEach(vgStore.videogames) { videogame in
                    NavigationLink(destination: RatingView(vgStore: self.vgStore, videogame: videogame)) {
                        Text(videogame.title)
                    }
                }
            }.navigationBarTitle("Your Games").sheet(isPresented: $isPresented) {
                RatingView(vgStore: self.vgStore, videogame: Videogame())
            }
        }
    }
}

struct VideogamesList_Previews: PreviewProvider {
    static var previews: some View {
        VideogamesList()
    }
}
