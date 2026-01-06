//
//  ContentView.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 03/10/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tracker = GymTracker()
    @State private var selectedTab = 0
    let tabs = ["Home", "Workout", "History"]
    let tabIcons = ["house.fill","dumbbell.fill", "clock.arrow.trianglehead.counterclockwise.rotate.90"]
    var body: some View {
        VStack{
            switch selectedTab {
            case 0:
                HomeView()
                    .environmentObject(tracker)
            case 1:
                WorkoutView()
                    .environmentObject(tracker)
            case 2:
                PreviousWorkoutView()
                    .environmentObject(tracker)
                Spacer()
            default:
                HomeView()
                    .environmentObject(tracker)
            }
            HStack(spacing: 30){
                ForEach (0..<tabs.count, id: \.self){ tab in
                    Button {
                        changeTab(tab: tab)
                    } label: {
                        VStack{
                            Image(systemName: tabIcons[tab])
                                .font(.system(size: 20))
                                .frame(width: 24, height: 24)
                            Text(tabs[tab])
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    func changeTab(tab: Int) -> () {
        selectedTab = tab
    }
    
}

#Preview {
    ContentView()
        .environmentObject(GymTracker())
}
