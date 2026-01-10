//
//  HomeView.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 06/01/2026.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var tracker: GymTracker
    @Environment(\.colorScheme) var colorScheme
    @State var weightLifted: Float = 0.0
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Workout Summary")
                        .font(.headline)
                    Spacer()
                }
                
                HStack{
                    Text("Total weight lifted across all sessions")
                        .font(.headline)
                    Spacer()
                }
                .onAppear {
                    weightLifted = tracker.getTotalWeightLifted(workoutEntries: tracker.workoutEntries)
                }
                
                HStack{
                    Text("\(weightLifted, format: .number.precision(.fractionLength(0...2))) kg")
                        .font(.headline)
                    Spacer()
                }
                
                HStack{
                    Text("Most recent Workout Stats")
                        .font(.headline)
                    Spacer()
                }
                Spacer()
            }
            .navigationTitle(Text("Gym Tracker"))
        }
        .padding()
    }
}

#Preview {
    HomeView()
        .environmentObject(GymTracker())
}
