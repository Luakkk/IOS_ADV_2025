// 📌 ContentView.swift
//  MemoryManagement
//  Created by Alua Smanova on 22.02.2025.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: ProfileManagerView()) {
                    Text("Manage Profiles")
                        .frame(width: 250, height: 50)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: ImageLoaderView()) {
                    Text("Image Cache")
                        .frame(width: 250, height: 50)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Memory Management")
        }
    }
}
