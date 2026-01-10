//
//  PreviousWorkoutEntryCardView.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 06/01/2026.
//

import SwiftUI

struct PreviousWorkoutEntryCardView: View {
    let workoutEntry: WorkoutEntry
    var body: some View {
        VStack{
            Divider()
            HStack{
                Text("Workout on \(workoutEntry.date, style: .date)")
                    .font(.title3)
                Spacer()
            }
            ForEach(workoutEntry.exercises, id: \.self) {exercise in
                HStack{
                    Text("\(exercise.name)")
                        .font(.headline)
                    Spacer()
                }
                ForEach(exercise.sets, id: \.self) {set in
                    HStack{
                        Text("\(set.reps) reps of \(set.weight, format: .number.precision(.fractionLength(0...2))) KG")
                        Spacer()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    let set = SetDetails(weight: 12.5, reps: 10)
    let exercise = [Exercise(name: "Bicep curls", sets: [set, set])]
    let workoutType = WorkoutType(name: "Upper body", exercises: ["Bicep curls"])
    let workoutEntry = WorkoutEntry(workoutType: workoutType, date: Date() ,exercises: exercise)
    PreviousWorkoutEntryCardView(workoutEntry: workoutEntry)
}
