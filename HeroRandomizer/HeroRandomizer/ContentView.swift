//
//  ContentView.swift
//  HeroRandomizer
//
//  Created by Alua Smanova on 07.03.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = HeroViewModel()

    var body: some View {
        VStack {
            if let hero = viewModel.hero {
                Text(hero.name)
                    .font(.largeTitle)
                    .bold()
                    .padding()

                if let imageUrl = hero.images["md"], let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 300)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Full Name: \(hero.biography.fullName)")
                    Text("Place of Birth: \(hero.biography.placeOfBirth)")
                    Text("First Appearance: \(hero.biography.firstAppearance)")
                    Text("Intelligence: \(hero.powerstats.intelligence)")
                    Text("Strength: \(hero.powerstats.strength)")
                    Text("Speed: \(hero.powerstats.speed)")
                    Text("Durability: \(hero.powerstats.durability)")
                    Text("Power: \(hero.powerstats.power)")
                    Text("Combat: \(hero.powerstats.combat)")
                }
                .padding()
            } else {
                Text("Press the button to get a hero!")
                    .padding()
            }

            Button("Random Hero") {
                viewModel.fetchHero()
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .onAppear {
            viewModel.fetchHero()
        }
    }
}
