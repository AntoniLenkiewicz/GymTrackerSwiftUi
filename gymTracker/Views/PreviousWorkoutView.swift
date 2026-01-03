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
        VStack{
            ForEach(tracker.workouts, id: \.self) {workoutType in
                PreviousWorkoutCardView(workoutType: workoutType)
            }
        }
    }
}

#Preview {
    PreviousWorkoutView()
        .environmentObject(GymTracker())
}
