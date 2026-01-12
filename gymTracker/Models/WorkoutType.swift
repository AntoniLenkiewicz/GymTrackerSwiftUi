//
//  WorkoutStruct.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 03/10/2025.
//

import Foundation

struct WorkoutType: Hashable, Codable, Identifiable{
    let id: UUID
    var name: String
    var exercises: [String]
    init(id: UUID = UUID(), name: String, exercises: [String] = []) {
        self.id = id
        self.name = name
        self.exercises = exercises
    }
}
