//
//  AddWorkoutView.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 03/10/2025.
//

import SwiftUI

struct AddWorkoutView: View {
    @Environment(\.dismiss) var dismiss
    @State private var exercises = [String]()
    @State private var newExercise: String = ""
    @State private var workoutName: String = ""
    @EnvironmentObject var tracker: GymTracker
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section{
                        TextField("Name", text: $workoutName)
                    }
                    ForEach(exercises, id: \.self) { exercise in
                        Text("\(exercise)")
                    }
                    .onDelete(perform: removeItems)
                    TextField("Add exercise", text: $newExercise)
                        .onSubmit {
                            exercises.append(newExercise)
                            newExercise = ""
                        }
                }
                Spacer()
            }
            .navigationTitle("Add Workout")
            .toolbar{
                Button("Save"){
                    
                    let newWorkout = WorkoutType(name: workoutName, exercises: exercises)
                    tracker.workouts.append(newWorkout)
                    dismiss()
                }
            }
        }
    }
    func removeItems(at offset: IndexSet) {
        exercises.remove(atOffsets: offset)
    }
}

#Preview {
    AddWorkoutView()
        .environmentObject(GymTracker())
}
