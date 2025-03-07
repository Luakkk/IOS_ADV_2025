//
//  HeroViewModel.swift
//  HeroRandomizer
//
//  Created by Alua Smanova on 07.03.2025.
//
import Foundation

class HeroViewModel: ObservableObject {
    @Published var hero: Hero?

    func fetchHero() {
        guard let url = URL(string: "https://akabab.github.io/superhero-api/api/all.json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            if let heroes = try? JSONDecoder().decode([Hero].self, from: data) {
                DispatchQueue.main.async {
                    self.hero = heroes.randomElement()
                }
            }
        }.resume()
    }
}
