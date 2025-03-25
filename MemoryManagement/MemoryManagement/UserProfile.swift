//
//  UserProfile.swift
//  MemoryManagement
//
//  Created by Alua Smanova on 22.02.2025.
//
import Foundation

struct UserProfile: Hashable, Identifiable {
    let id: UUID
    let username: String
    var bio: String
    var followers: Int
}
