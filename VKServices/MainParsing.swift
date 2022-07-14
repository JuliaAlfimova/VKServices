//
//  MainParsing.swift
//  VKServices
//
//  Created by juliemoorled on 14.07.2022.
//

import UIKit

extension MainViewController {
    
    func getData() {
        let urlString = "https://publicstorage.hb.bizmrg.com/sirius/result.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            do {
                let jsonData = try JSONDecoder().decode(JSONData.self, from: data)
                let body = jsonData.body
                self.vkServices = body.services
            } catch {
                print(error)
            }
        }.resume()
    }
    
}

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
