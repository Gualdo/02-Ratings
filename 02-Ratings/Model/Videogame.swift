//
//  Videogame.swift
//  02-Ratings
//
//  Created by De La Cruz, Eduardo on 31/12/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import SwiftUI
import Combine

struct Videogame: Identifiable {
    var id: UUID = UUID()
    var title: String = ""
    var rating: Double = 0
    var played: Bool = false
}

class VideogameStore: ObservableObject {
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    var videogames: [Videogame] {
        didSet {
            objectWillChange.send()
        }
    }
    
    init() {
        var vg1 = Videogame()
        vg1.title = "Farcry 5"
        vg1.played = true
        vg1.rating = 4
        
        var vg2 = Videogame()
        vg2.title = "Assassin's Creed Origin"
        
        var vg3 = Videogame()
        vg3.title = "Resident Evil 2"
        vg3.played = true
        
        videogames = [vg1, vg2, vg3]
    }
    
    func addVideogame(videogame: Videogame) {
        videogames.append(videogame)
    }
    
    func updateVideogame(videogame: Videogame) {
        guard let index = videogames.firstIndex(where: { vg in
            vg.id == videogame.id
        }) else { return }
        
        videogames[index] = videogame
    }
}
