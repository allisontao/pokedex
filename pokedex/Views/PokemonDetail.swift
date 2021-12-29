//
//  PokemonDetail.swift
//  pokedex
//
//  Created by Allison Tao on 2021-12-29.
//

import SwiftUI

struct PokemonDetail: View {
    let entry: PokemonEntry
    @State private var pokemonSprite = ""
    
    var body: some View {
        HStack {
            Text(entry.name).font(.title)
            PokemonImage(imageLink: "\(entry.url)")
        }
    }

}


struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetail(entry: PokemonEntry(name: "Bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
    }
}

