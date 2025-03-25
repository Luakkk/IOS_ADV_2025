//
//  FeedSystem.swift
//  MemoryManagement
//
//  Created by Alua Smanova on 22.02.2025.
//
import Foundation

class FeedSystem {
    private var userCache: [UUID: UserProfile] = [:]
    private var feedPosts: [Post] = []
    private var hashtags: Set<String> = []
    
    func addPost(_ post: Post) {
        feedPosts.insert(post, at: 0)
    }
    
    func removePost(_ post: Post) {
        feedPosts.removeAll { $0.id == post.id }
    }
}
