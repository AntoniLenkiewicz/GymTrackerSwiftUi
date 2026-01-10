//
//  GymTrackerModel.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 03/10/2025.
//

import Foundation
import SwiftUI
internal import Combine

class GymTracker: ObservableObject {
    @Published var workouts = [WorkoutType]()
    @Published var workoutEntries = [WorkoutEntry]()
    
    func createEmptyWorkoutEntry(workoutType: WorkoutType) -> WorkoutEntry {
        var exerciseList = [Exercise]()
        for exercise in workoutType.exercises {
            let newExercise = Exercise(name: exercise, sets: [])
            exerciseList.append(newExercise)
        }
        let workoutEntry = WorkoutEntry(workoutType: workoutType, date: Date(), exercises: exerciseList)
        return workoutEntry
    }
    
    func saveWorkoutEntry(workoutEntry: WorkoutEntry) {
        workoutEntries.append(workoutEntry)
    }
    
    func getTotalWeightLifted(workoutEntries: [WorkoutEntry]) -> Float {
        var totalWeight: Float = 0.0;
        for entry in workoutEntries {
            for exercise in entry.exercises {
                for set in exercise.sets {
                    totalWeight += (set.weight * Float(set.reps))
                }
            }
        }
        return totalWeight;
    }
        
}
