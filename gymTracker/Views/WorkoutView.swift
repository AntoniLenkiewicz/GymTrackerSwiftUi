//
//  HomeView.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 04/10/2025.
//

import SwiftUI

struct WorkoutView: View {
    @EnvironmentObject var tracker: GymTracker
    @State private var showingAddWorkout: Bool = false
    var body: some View {
        NavigationStack {
            VStack{
                ForEach(tracker.workouts, id: \.self) {workout in
                    NavigationLink(value: workout){
                        WorkoutCardView(workout: workout)
                    }
                    .buttonStyle(.plain)
                }
                Spacer()
                    .navigationTitle(Text("Start Workout"))
                    .toolbar {
                        Button{
                            showingAddWorkout = true
                        } label : {
                            HStack{
                                Text("Add New Workout")
                                    .font(.subheadline)
                                Image(systemName: "plus")
                            }
                        }
                    }
            }
            .navigationDestination(for: WorkoutType.self) { workoutType in
                EditWorkoutView(workoutType: workoutType, workoutEntry: tracker.createEmptyWorkoutEntry(workoutType: workoutType))
            }
            .sheet(isPresented: $showingAddWorkout, content: {
                AddWorkoutView()
            })
        }
        .padding()
    }
}

#Preview {
    WorkoutView()
        .environmentObject(GymTracker())

}
