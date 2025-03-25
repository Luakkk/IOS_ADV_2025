//
//  ImageLoader.swift
//  MemoryManagement
//
//  Created by Alua Smanova on 22.02.2025.
//
import SwiftUI
import Combine

protocol ImageLoaderDelegate: AnyObject {
    func imageLoader(_ loader: ImageLoader, didLoad image: UIImage)
    func imageLoader(_ loader: ImageLoader, didFailWith error: Error)
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    weak var delegate: ImageLoaderDelegate?
    private var cancellable: AnyCancellable?
    private static let imageCache = NSCache<NSURL, UIImage>()
    
    func loadImage(from url: URL) {
        if let cachedImage = ImageLoader.imageCache.object(forKey: url as NSURL) {
            self.image = cachedImage
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                guard let self = self, let image = image else { return }
                ImageLoader.imageCache.setObject(image, forKey: url as NSURL)
                self.image = image
            }
    }
}
