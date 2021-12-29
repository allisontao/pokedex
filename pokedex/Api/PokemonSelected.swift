//
//  PokemonSelected.swift
//  pokedex
//
//  Created by Allison Tao on 2021-12-27.
//

import Foundation

struct PokemonSelected: Codable {
    var sprites: PokemonSprites
    var weight: Int
}

struct PokemonSprites: Codable {
    var front_default: String
}

struct BaseExp: Codable {
    var base_experience: String
}

class PokemonSelectedApi {
    func getData(url: String, completion: @escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
            
        }.resume()
    }
}
