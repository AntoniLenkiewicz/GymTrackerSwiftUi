//
//  Exercise.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 08/10/2025.
//

import Foundation

struct Exercise: Codable, Identifiable, Hashable {
    let id: UUID
    let name: String
    var sets: [SetDetails]
    
    init(id: UUID = UUID(), name: String, sets: [SetDetails] = []) {
            self.id = id
            self.name = name
            self.sets = sets
        }
}
