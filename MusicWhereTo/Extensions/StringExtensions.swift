//
//  StringExtensions.swift
//  MusicWhereTo
//
//  Created by Grzegorz Górnisiewicz on 30/04/2019.
//  Copyright © 2019 Long Road. All rights reserved.
//

import Foundation

extension String {
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
    
    var integerValue: Int {
        return (self as NSString).integerValue
    }
}
