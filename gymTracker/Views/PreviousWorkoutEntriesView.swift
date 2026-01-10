//
//  PreviousWorkoutEntriesView.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 06/01/2026.
//

import SwiftUI

struct PreviousWorkoutEntriesView: View {
    let workoutType: WorkoutType
    @EnvironmentObject var tracker: GymTracker
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ScrollView{
            ForEach(tracker.workoutEntries) {workoutEntry in
                if workoutEntry.workoutType.name == workoutType.name {
                    PreviousWorkoutEntryCardView(workoutEntry: workoutEntry)
                }
            }
        }
        .buttonStyle(.plain)
        .navigationTitle(Text(workoutType.name))
    }
}

#Preview {
    let workout = WorkoutType(name: "Legs", exercises: ["Leg extensions", "Rdls", "Hack Squats"])
    PreviousWorkoutEntriesView(workoutType: workout)
        .environmentObject(GymTracker())
}
