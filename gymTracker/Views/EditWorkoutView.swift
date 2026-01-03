//
//  TrackWorkoutView.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 04/10/2025.
//

import SwiftUI

struct EditWorkoutView: View {
    @EnvironmentObject var tracker: GymTracker
    @Environment(\.colorScheme) var colorScheme
    @State var workoutType: WorkoutType
    @State var workoutEntry: WorkoutEntry
    @FocusState var isFocused: Bool
    var body: some View {
        List{
            ForEach ($workoutEntry.exercises){ $exercise in
                Section(header:
                            HStack{
                    Text("\(exercise.name)")
                        .font(.title2)
                        .foregroundStyle(colorScheme == .light ? .black : .white)
                    Spacer()
                    Button("Add Set"){
                        print("1")
                        addSet(exercise: &exercise)
                    }
                    .foregroundStyle(colorScheme == .light ? .black : .white)
                    .padding(6)
                    .buttonStyle(PlainButtonStyle())
                    .overlay{
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(colorScheme == .light ? .black : .white, lineWidth: 2)
                    }
                }){
                    ForEach ($exercise.sets) { $set in
                        HStack{
                            TextField("Weight", value: $set.weight, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($isFocused)
                            Text("KG")
                            TextField("Reps", value: $set.reps, format: .number)
                                .keyboardType(.numberPad)
                                .focused($isFocused)
                            Text("Repetitions")
                            
                        }
                        .swipeActions(allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                if let indexToDelete = exercise.sets.firstIndex(where: {$0.id == set.id }) {
                                    exercise.sets.remove(at: indexToDelete)
                                }
                                
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                        }
                    }
                }
            }
        }
            .scrollContentBackground(.hidden)
            .navigationTitle(Text("Track Workout"))
            .toolbar{
                Button("Save"){
                    print(workoutEntry)
                    tracker.saveWorkoutEntry(workoutEntry: workoutEntry)
                    print("2")
                }
            }
    }
    func addSet(exercise: inout Exercise){
        let set = SetDetails(weight: 0, reps: 0)
        exercise.sets.append(set)
    }
}

#Preview {
    let workout = WorkoutType(name: "Arms", exercises: ["Bicep Curls", "Tricep Extensions", "Lat Raises"])
    let exercise = Exercise(name: "Bicep Curls", sets: [])
    let exercise2 = Exercise(name: "Tricep Extensions", sets: [])
    let exercise3 = Exercise(name: "Lat raises", sets: [])
    let workoutEntry = WorkoutEntry(workoutType: workout,date: Date(), exercises: [exercise, exercise2, exercise3])
    EditWorkoutView(workoutType: workout, workoutEntry: workoutEntry)
}
