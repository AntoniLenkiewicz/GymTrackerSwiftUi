//
//  Exercise.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 03/10/2025.
//

import Foundation

struct SetDetails: Identifiable, Codable, Hashable{
    let id: UUID
    var weight: Float
    var reps: Int
    init(id: UUID = UUID(), weight: Float, reps: Int) {
        self.id = id
        self.weight = weight
        self.reps = reps
    }
}
