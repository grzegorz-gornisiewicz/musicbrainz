//
//  Place.swift
//  MusicWhereTo
//
//  Created by Grzegorz Górnisiewicz on 30.04.2019.
//  Copyright © 2019 Long Road. All rights reserved.
//

import Foundation

struct Place: Codable {
    var pid: String?
    var type: String?
    var score: Int?
    var name: String?
    var coordinates: Coordinates?
    var lifespan: Lifespan?
    
    private enum CodingKeys: String, CodingKey {
        case pid = "id"
        case type
        case score
        case name
        case coordinates
        case lifespan = "life-span"
    }
}
