//
//  Hero.swift
//  HeroRandomizer
//
//  Created by Alua Smanova on 07.03.2025.
//
import Foundation

struct Hero: Codable, Identifiable {
    let id: Int
    let name: String
    let images: [String: String]
    let powerstats: PowerStats
    let biography: Biography
}

struct PowerStats: Codable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}

struct Biography: Codable {
    let fullName: String
    let placeOfBirth: String
    let firstAppearance: String
}
