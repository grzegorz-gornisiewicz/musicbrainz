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
    func setLifespan(_ lifespan: Double, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + lifespan, execute: {
            completion()
        });
    }
}
