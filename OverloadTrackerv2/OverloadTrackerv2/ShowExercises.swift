//
//  ShowWorkout.swift
//  OverloadTrackerv2
//
//  Created by St. Loreto on 11/13/23.
//

import UIKit

class ShowExercises: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    var workoutToShow: Workout!
    
    var onEditWorkout: ((Workout) -> Void)? = nil
    

    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        print("🍏workout in viewDidLoad \(workoutToShow)")
        self.title = workoutToShow.workoutName
    }

    override func viewWillAppear(_ animated: Bool) {
        
        print("🍏workout in viewDidAppear \(workoutToShow)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        refreshExercises()
    }

    @IBAction func didTapNewExerciseButton(_ sender: Any) {
        let exercise = Exercise(exerciseName: "New Exercise", exerciseSets: 1, exerciseTargetReps: 1)
        
        workoutToShow.workoutExercises.append(exercise)
        workoutToShow.save()
        self.refreshExercises()
        print("🍏 workout at didTapExerciseButton \(workoutToShow)")
    }
    
    @IBAction func didTapBackButton(_ sender: Any) {
        dismiss(animated: true)
        workoutToShow.save()
    }
    
    private func refreshExercises() {
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditExerciseSegue" {
            
        
        
        if let editNavController = segue.destination as? UINavigationController,
           let editViewController = editNavController.topViewController as? EditExercise {
                if let row = tableView.indexPathForSelectedRow?.row {
                    let selectedExercise = workoutToShow.workoutExercises[row]
                
                    editViewController.exerciseToEdit = selectedExercise
                
                
                }
            }
        }
    }
    
}
// MARK: - Table View Methods

extension ShowExercises: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutToShow.workoutExercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as? ExerciseCell else {
            fatalError("Cell not found")
        }
        
        let exercise = workoutToShow.workoutExercises[indexPath.row]
        
        cell.exerciseName.text = exercise.exerciseName
        cell.exerciseSets.text = String("Sets: \(exercise.exerciseSets)")
        cell.exerciseTargetReps.text = String("Reps: \(exercise.exerciseTargetReps)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // 1.
        if editingStyle == .delete {
            // 2.
            workoutToShow.workoutExercises.remove(at: indexPath.row)
            // 3.
            onEditWorkout?(workoutToShow)
            // 4.
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - Delegate Methods
    
extension ShowExercises: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        let selectedExercise = workoutToShow.workoutExercises[indexPath.row]
        
        print("🍏 Selected Exercise in Table Delegate \(selectedExercise)")
    }
}
    

