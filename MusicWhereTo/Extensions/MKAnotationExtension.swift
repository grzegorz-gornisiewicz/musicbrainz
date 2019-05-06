//
//  PlaceAnotation.swift
//  MusicWhereTo
//
//  Created by Grzegorz Górnisiewicz on 01/05/2019.
//  Copyright © 2019 Long Road. All rights reserved.
//

import UIKit
import MapKit

extension MKPointAnnotation {
    func setLifespan(_ year: Int, completion: @escaping () -> Void) {
        let lifespan = 1.0 * Double(year - 1990)
        print("year:\(year), ttl:\(lifespan)")

        DispatchQueue.main.asyncAfter(deadline: .now() + lifespan, execute: {
            completion()
        })
    }
}
