//
//  ProfileManagerView.swift
//  MemoryManagement
//
//  Created by Alua Smanova on 22.02.2025.
//
import SwiftUI

struct ProfileManagerView: View {
    @State private var profiles: [UserProfile] = []
    @StateObject private var manager = ProfileManager(delegate: nil)

    var body: some View {
        VStack {
            List(profiles, id: \ .id) { profile in
                Text(profile.username)
            }
            Button("Load Profile") {
                let id = UUID().uuidString
                manager.loadProfile(id: id) { result in
                    if case .success(let profile) = result {
                        DispatchQueue.main.async {
                            profiles.append(profile)
                        }
                    }
                }
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .navigationTitle("Profile Manager")
    }
}
