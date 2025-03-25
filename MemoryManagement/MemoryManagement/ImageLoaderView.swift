//
//  ImageLoaderView.swift
//  MemoryManagement
//
//  Created by Alua Smanova on 22.02.2025.
//
import SwiftUI

struct ImageLoaderView: View {
    @StateObject private var loader = ImageLoader()
    let url = URL(string: "https://example.com/image.jpg")!
    
    var body: some View {
        VStack {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
            } else {
                ProgressView()
            }
            Button("Load Image") {
                loader.loadImage(from: url)
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}
