//
//  Places.swift
//  MusicWhereTo
//
//  Created by Grzegorz Górnisiewicz on 30/04/2019.
//  Copyright © 2019 Long Road. All rights reserved.
//

import Foundation

struct Places: Codable {
    var created: String?
    var count: Int?
    var offset: Int?
    var places: [Place]?
}
