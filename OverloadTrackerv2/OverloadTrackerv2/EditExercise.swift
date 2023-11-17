//
//  EditExercise.swift
//  OverloadTrackerv2
//
//  Created by St. Loreto on 11/14/23.
//

import UIKit

class EditExercise: UIViewController {
    
    var exerciseToEdit: Exercise!
    
    @IBOutlet weak var tableView: UITableView!
    
    var onEditExercise: ((Workout) -> Void)? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        print("🍏 Exercise to edit: \(exerciseToEdit)")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.title = exerciseToEdit.exerciseName
        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapBackButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
}

extension EditExercise: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseToEdit.setResults.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SetDataCell", for: indexPath) as? SetDataCell else {
            fatalError("Cell not found")
        }
        
        let set = exerciseToEdit.setResults[indexPath.row]
        
        cell.setNumber.text = String(set.repsPerformed)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // 1.
        if editingStyle == .delete {
            // 2.
            exerciseToEdit.setResults.remove(at: indexPath.row)
            // 3.
            //onEditWorkout?(workoutToShow)
            // 4.
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

extension EditExercise: UITableViewDelegate {
    
}


