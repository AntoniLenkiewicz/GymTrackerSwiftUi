//
//  WorkoutView.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 04/10/2025.
//

import SwiftUI

struct PreviousWorkoutView: View {
    @EnvironmentObject var tracker: GymTracker
    var body: some View {
        NavigationStack{
            ScrollView{
                ForEach(tracker.workouts, id: \.self) {workoutType in
                    NavigationLink(value: workoutType) {
                        PreviousWorkoutCardView(workoutType: workoutType)
                    }
                    .buttonStyle(.plain)
                }
            }
            .navigationDestination(for: WorkoutType.self) { workoutType in
                PreviousWorkoutEntriesView(workoutType: workoutType)
            }
        }
    }
}

#Preview {
    PreviousWorkoutView()
        .environmentObject(GymTracker())
}
