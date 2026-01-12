//
//  WorkoutDataManager.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 12/01/2026.
//

import Foundation

class WorkoutDataManager {
//    Class to manage saving and loading workout data from documents
    func save(workouts: [WorkoutEntry]) {
        do {
            let jsonUrl = URL.documentsDirectory.appending(path: "workouts.json")
            let encoder = JSONEncoder()
            let workoutsData = try encoder.encode(workouts)
            try workoutsData.write(to: jsonUrl)
        } catch {
            print(error.localizedDescription)
      }
    }
    func load() -> [WorkoutEntry] {
        let jsonUrl = URL.documentsDirectory.appending(path: "workouts.json")
        if FileManager.default.fileExists(atPath: jsonUrl.path) {
            do {
                let decoder = JSONDecoder()
                let workoutsData = try Data(contentsOf: jsonUrl)
                let workouts: [WorkoutEntry] = try decoder.decode([WorkoutEntry].self, from: workoutsData)
                return workouts
            } catch {
                print(error.localizedDescription)
                return []
            }
        }
        return []
    }
}
