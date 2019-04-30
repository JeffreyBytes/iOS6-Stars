//
//  StarController.swift
//  iOS6-Stars
//
//  Created by Jeffrey Carpenter on 4/30/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import Foundation

class StarController {
    
    private(set) var stars: [Star] = []
    
    func addStar(named name: String, withDistance distance: Double) {
        
        let newStar = Star(name: name, distance: distance)
        stars.append(newStar)
    }
}
