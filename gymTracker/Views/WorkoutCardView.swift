//
//  WorkoutCardView.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 03/10/2025.
//

import SwiftUI

struct WorkoutCardView: View {
    let workout: WorkoutType
    var exerciseList: String {
        var exercises = ""
        for exercise in workout.exercises {
            exercises += exercise + " "
        }
        return exercises
    }
    var body: some View {
        VStack{
            HStack{
                Text(workout.name)
                    .font(.title)
                    .padding(.horizontal, 15)
                Spacer()
            }
            HStack{
                Text("\(exerciseList)")
                    .font(.subheadline)
                Spacer()
            }
            .padding(.horizontal, 15)
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .background{
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 2)
                .padding(2.5)
                .frame(maxWidth: .infinity)
        }
    }
}
#Preview {
    let workout = WorkoutType(name: "Legs", exercises: ["Leg extensions", "Rdls", "Hack Squats"])
    WorkoutCardView(workout: workout)
}
