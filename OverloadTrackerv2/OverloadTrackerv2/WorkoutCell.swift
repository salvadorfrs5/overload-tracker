//
//  TableViewCell.swift
//  OverloadTracker
//
//  Created by St. Loreto on 11/11/23.
//

import UIKit

class WorkoutCell: UITableViewCell {
    
    @IBOutlet weak var dayNumberLabel: UILabel!
    @IBOutlet weak var workoutNameLabel: UILabel!
    
    var workout: Workout!
    
    func configure(with workout: Workout) {
        self.workout = workout
        update(with: workout)
    }
    
    private func update(with workout: Workout) {
        let dayNumber = "Day: " + String(workout.dayOfSplit)
        
        dayNumberLabel.text = dayNumber
        workoutNameLabel.text = workout.workoutName
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) { }
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
}
