//
//  NetworkManager.swift
//  NasaDataFetch
//
//  Created by Uday Vanaparthy on 02/02/22.
//

import Foundation
import UIKit

struct Photos: Codable {
    var photos:[NewPhotos]?
}

struct NewPhotos: Codable {
    let sol: Int?
    var id: Int?
    let img_src: String?
}

func getJson(completion: @escaping ([NewPhotos])-> ()) {
    let urlString = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=Q9YNbzmt8C5OpY7L3MV4DHJhrdIGCbjx3tVWxRcf&sol=2000&page=1"
    if let url = URL(string: urlString) {
        URLSession.shared.dataTask(with: url) {data, res, err in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let json: Photos = try! decoder.decode(Photos.self, from: data)
                    if let data = json.photos {
                        completion(data)
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
