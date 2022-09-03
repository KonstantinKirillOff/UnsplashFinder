//
//  NetworkManager.swift
//  UnsplashFinder
//
//  Created by Konstantin Kirillov on 03.09.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchURLUnslashImage(for wordOnEnglish: String, handler: @escaping (_ urlString: String) -> Void) {
        let key = "LUMG6YSLoGTass_HzRDzERd_dmrCMBSHpxqku6yl7P8"
        let query = wordOnEnglish.replacingOccurrences(of: " ", with: "%20")
        
        guard let url = URL(string: "https://api.unsplash.com/search/photos?query=\(query)&client_id=\(key)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return }
            
            do {
                let picturesForRequesr = try JSONDecoder().decode(UnsplashResponse.self, from: data)
                if picturesForRequesr.result.count > 0 {
                    DispatchQueue.main.async {
                        handler(picturesForRequesr.result.randomElement()!.urls["thumb"]!)
                    }
                }
            } catch let error {
                print(error.localizedDescription)
                handler("")
            }
        }.resume()
        
    }
    
    private init() {}
}
