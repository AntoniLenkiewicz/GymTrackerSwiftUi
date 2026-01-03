//
//  Exercise.swift
//  gymTracker
//
//  Created by Antoni Lenkiewicz on 08/10/2025.
//

import Foundation

struct Exercise: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    var sets: [SetDetails]
}
