//
//  Workout.swift
//  OverloadTracker
//
//  Created by Salvador Frias on 11/7/23.
//

import Foundation

// NOTE: Need to convert strings from text fields to ints or doubles
struct Workout: Codable {
    var dayOfSplit: Int
    var id: String = UUID().uuidString
    var workoutDate: Date
    var workoutName: String
    var workoutExercises: [Exercise]
    
    init(workoutName: String, dayOfSplit: Int, workoutDate: Date) {
        self.dayOfSplit = dayOfSplit
        self.workoutDate = workoutDate
        self.workoutName = workoutName
        self.workoutExercises = [Exercise]()
    }
    
}

struct Exercise: Codable {
    var exerciseName: String
    var exerciseSets: Int
    var exerciseTargetReps: Int
    var exerciseNotes: String?
    var setResults: [SetPerformance]
    
    init(exerciseName: String, exerciseSets: Int, exerciseTargetReps: Int, exerciseNotes: String? = nil) {
        self.exerciseName = exerciseName
        self.exerciseSets = exerciseSets
        self.exerciseTargetReps = exerciseTargetReps
        self.exerciseNotes = exerciseNotes
        self.setResults = [SetPerformance]()
    }
}

struct SetPerformance: Codable {
    var repsPerformed: Int
    var weight: Double
    
    init(repsPerformed: Int, weight: Double) {
        self.repsPerformed = repsPerformed
        self.weight = weight
    }
}

// MARK: - Workout Extension

extension Workout {

    // Function to encode and save workouts to UserDefaults
    static func save(_ workouts: [Workout]) {
        do {
            let encoder = JSONEncoder()
            let encodedWorkouts = try encoder.encode(workouts)
            UserDefaults.standard.set(encodedWorkouts, forKey: "workouts")
        } catch {
            print("Error encoding workouts: \(error)")
        }
    }

    // Function to retrieve workouts from UserDefaults
    static func getWorkouts() -> [Workout] {
        if let savedWorkoutData = UserDefaults.standard.data(forKey: "workouts") {
            do {
                let decoder = JSONDecoder()
                let workouts = try decoder.decode([Workout].self, from: savedWorkoutData)
                return workouts
            } catch {
                print("Error decoding workouts: \(error)")
            }
        }
        return []
    }

    // Function to add or update a workout in UserDefaults
    func save() {
        var workouts = Workout.getWorkouts()
        if let existingWorkoutIndex = workouts.firstIndex(where: { $0.id == self.id }) {
            // Update existing workout
            workouts.remove(at: existingWorkoutIndex)
            workouts.insert(self, at: existingWorkoutIndex)
        } else {
            // Add new workout
            workouts.append(self)
        }
        Workout.save(workouts)
    }
    
}
