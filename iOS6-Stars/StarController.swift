//
//  StarController.swift
//  iOS6-Stars
//
//  Created by Jeffrey Carpenter on 4/30/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import Foundation

class StarController {
    
    init() {
        loadFromPersistentStore()
    }
    
    private(set) var stars: [Star] = [] {
        didSet {
            saveToPersistentStore()
        }
    }
    
    private var persistentURL: URL? {
        
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("stars.plist")
    }
    
    func addStar(named name: String, withDistance distance: Double) {
        
        let newStar = Star(name: name, distance: distance)
        stars.append(newStar)
    }
    
    func saveToPersistentStore() {
        
        guard let url = persistentURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            fatalError("Error saving data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        let fileManager = FileManager.default
        guard let url = persistentURL,
        fileManager.fileExists(atPath: url.path)
        else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            fatalError("Error loading data: \(error)")
        }
    }
}
