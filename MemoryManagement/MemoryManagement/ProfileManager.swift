//
//  ProfileManager.swift
//  MemoryManagement
//
//  Created by Alua Smanova on 22.02.2025.
//

import Foundation

protocol ProfileUpdateDelegate: AnyObject {
    func profileDidUpdate(_ profile: UserProfile)
    func profileLoadingError(_ error: Error)
}

class ProfileManager: ObservableObject {
    @Published private var activeProfiles: [String: UserProfile] = [:]
    weak var delegate: ProfileUpdateDelegate?
    
    init(delegate: ProfileUpdateDelegate? = nil) {
        self.delegate = delegate
    }
    
    func loadProfile(id: String, completion: @escaping (Result<UserProfile, Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            let profile = UserProfile(id: UUID(), username: "User \(id)", bio: "iOS Developer", followers: 100)
            self.activeProfiles[id] = profile
            DispatchQueue.main.async {
                self.delegate?.profileDidUpdate(profile)
                completion(.success(profile))
            }
        }
    }
}
