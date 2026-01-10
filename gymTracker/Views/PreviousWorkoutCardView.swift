//
//  PreviousWorkoutCardView.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 24/10/2025.
//

import SwiftUI

struct PreviousWorkoutCardView: View {
    let workoutType: WorkoutType
    var body: some View {
        VStack{
            HStack{
                Text("\(workoutType.name)")
                    .font(.largeTitle)
                Spacer()
            }
            Divider()
            ForEach(workoutType.exercises, id: \.self) {exercise in
                HStack{
                    Text("\(exercise)")
                    Spacer()
                }
            }
            Divider()
        }
        .padding(15)
    }
}

#Preview {
    let workout = WorkoutType(name: "Legs", exercises: ["Leg extensions", "Rdls", "Hack Squats"])
    PreviousWorkoutCardView(workoutType: workout)
}
