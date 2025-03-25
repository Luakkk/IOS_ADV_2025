//
//  Post.swift
//  MemoryManagement
//
//  Created by Alua Smanova on 22.02.2025.
//
import Foundation

struct Post: Hashable, Identifiable {
    let id: UUID
    let authorId: UUID
    var content: String
    var likes: Int
}
