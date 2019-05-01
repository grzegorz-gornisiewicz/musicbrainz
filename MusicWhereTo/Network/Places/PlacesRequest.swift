//
//  Places.swift
//  MusicWhereTo
//
//  Created by Grzegorz Górnisiewicz on 30.04.2019.
//  Copyright © 2019 Long Road. All rights reserved.
//

import Foundation

class PlacesRequest {
    var pcs: [Place] = []
    var offset = 0

    let apiURL = "https://musicbrainz.org/ws/2/place"

    func find(_ searchTerm: String, _ limit: Int = 20, completion: @escaping ([Place], _ error:Error?) -> Void) {
        if var urlComponents = URLComponents(string: apiURL) {
            urlComponents.query = "query=\(searchTerm)&fmt=json&limit=\(limit)&offset=\(offset)"

            print("urlComponents:\(urlComponents)")
            
            guard let url = urlComponents.url else { return }

            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, _) in
                guard let data = data else { return }
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(Places.self, from: data)
                    if let places = result.places {
                        completion(places, nil)
                        if limit > 0 && result.count! > (self.offset + limit) {
                            self.offset += limit
                            self.find(searchTerm, limit, completion: completion)
                        } else {
                            self.offset = 0
                        }
                    } else {
                        completion([], nil)
                    }
                } catch {
                    completion([], error)
                }
            }).resume()
        }
    }
}
