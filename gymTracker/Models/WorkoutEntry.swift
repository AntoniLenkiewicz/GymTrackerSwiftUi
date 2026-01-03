//
//  Exercises.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 04/10/2025.
//

import Foundation

struct WorkoutEntry: Codable, Identifiable, Hashable {
    let id = UUID()
    let workoutType: WorkoutType
    let date: Date
    var exercises: [Exercise]
}
