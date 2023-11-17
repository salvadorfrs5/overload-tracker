//
//  ExerciseCell.swift
//  OverloadTrackerv2
//
//  Created by St. Loreto on 11/13/23.
//

import UIKit

class ExerciseCell: UITableViewCell {

    @IBOutlet weak var exerciseName: UILabel!
    
    @IBOutlet weak var exerciseSets: UILabel!
    
    @IBOutlet weak var exerciseTargetReps: UILabel!
    
    var exercise: Exercise!
    
    
    func configure(with exercise: Exercise) {
        self.exercise = exercise
        self.exerciseName.text = exercise.exerciseName
        print("🍏Exercise in cell: \(exercise)")
        update(with: exercise)
    }
    
    private func update (with exercise: Exercise) {
        let exerciseNameString = self.exercise.exerciseName
        exerciseName.text = exerciseNameString
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) { }
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }

}
