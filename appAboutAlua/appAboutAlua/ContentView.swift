// 📌 ContentView.swift
//  appAboutAlua
//  Created by Alua on 06.02.2025.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: SkillsView()) {
                    Text("General Info")
                        .frame(width: 250, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: ProjectsView()) {
                    Text("What I Do For Living")
                        .frame(width: 250, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Info About Me")
        }
    }
}

struct SkillsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("me")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text("Name: Alua\nBirth Date: April 9, 2005\nZodiac Sign: Aries")
                .multilineTextAlignment(.center)
        }
        .padding()
        .navigationTitle("General Info")
    }
}

struct ProjectsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("work")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text("My Job: none\nMy Hobbies: Reading books/fanfictions/manga, sleeping\nThings I Don't Like: Spring (due to my allergic reaction)")
                .multilineTextAlignment(.center)
        }
        .padding()
        .navigationTitle("What I Do For Living")
    }
}

