//
//  ViewController.swift
//  OverloadTracker
//
//  Created by Salvador Frias on 11/7/23.
//

import UIKit

class WorkoutViewController: UIViewController {
    
    @IBOutlet weak var weekLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var workouts = [Workout]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d"
        // Get the current date
        let currentDate = Date()
        // Format the date and set it to the label
        //self.title = dateFormatter.string(from: currentDate)
        
        // Create a custom view with a multiline label for the date range
        setupMultilineTitleLabel()
        
        // Set the original title (e.g., "Your Title") for the navigation item
        navigationItem.title = dateFormatter.string(from: currentDate)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        refreshWorkouts()
    }
    
    // New Workout button
    
    @IBAction func didTapNewWorkoutButton(_ sender: Any) {
        performSegue(withIdentifier: "ComposeSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ComposeSegue" {
            if let composeNavController = segue.destination as? UINavigationController,
               
               let composeViewController  = composeNavController.topViewController as? WorkoutInputViewController {
                
                composeViewController.onComposeWorkout = { [weak self] workout in
                    workout.save()
                    self?.refreshWorkouts()
                }
            }
        }
        
        else if segue.identifier == "ShowWorkoutSegue" {
                
               
            if let showNavController = segue.destination as? UINavigationController,
                let showViewController = showNavController.topViewController as? ShowExercises {
                if let row = tableView.indexPathForSelectedRow?.row {
                    let selectedWorkout = workouts[row]
                    showViewController.workoutToShow = selectedWorkout
                }
                    //let senderWorkout = sender as? Workout {
                    

                //showViewController.workoutToShow = sender as? Workout
              
                print("🍏Sender Workout in prepareForSegue: \(sender)")
                  
                //dump(showViewController.workoutToShow)
                
                
              showViewController.onEditWorkout = { [weak self] workout in
                  workout.save()
                  self?.refreshWorkouts()
              }
                
            }
        }
        
    }
// MARK: - Helper Functions
    
    private func refreshWorkouts() {
        // 1.
        var workouts = Workout.getWorkouts()
        // 2.
        workouts.sort { lhs, rhs in
            // Update this to sort by day of split once you have weekly sorting
                return lhs.workoutDate < rhs.workoutDate
        }
        self.workouts = workouts

        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        
        dump(workouts)
    }
    
    // MARK: - Date Format Nav Bar Title
    
    func formatWeekDateRange() -> String {
        let calendar = Calendar.current
        let currentDate = Date()
        
        // Determine the start date of the week (Sunday)
        var startDateComponents = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: currentDate)
        startDateComponents.weekday = 1 // 1 represents Sunday
        let startDate = calendar.date(from: startDateComponents)!
        
        // Determine the end date of the week (Saturday)
        let endDate = calendar.date(byAdding: .day, value: 6, to: startDate)!
        
        // Create a date formatter and set the desired format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d/M" // Format as "Day/Month - Day/Month"
        
        // Format the start and end dates
        let formattedStartDate = dateFormatter.string(from: startDate)
        let formattedEndDate = dateFormatter.string(from: endDate)
        
        // Create the final formatted string
        let formattedDateRange = "Week of \(formattedStartDate) - \(formattedEndDate)"
        
        return formattedDateRange
    }
    
    func setupMultilineTitleLabel() {
        // Create a custom title view with a multiline label for the date range
        let titleView = UIView()
        
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.text = formatWeekDateRange()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textColor = .black
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        
        // Set the custom view as the titleView
        navigationItem.titleView = titleView
    }
}
// MARK: - TableView Methods
        
extension WorkoutViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return workouts.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath) as! WorkoutCell
            
            let workout = workouts[indexPath.row]
            
            cell.configure(with: workout)
            
            return cell
        }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // 1.
        if editingStyle == .delete {
            // 2.
            workouts.remove(at: indexPath.row)
            // 3.
            Workout.save(workouts)
            // 4.
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
        
    
}

// MARK: - Table View Delegate Methods

extension WorkoutViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        let selectedWorkout = workouts[indexPath.row]
        
        print("🍏Selected Workout in Table delegate \(selectedWorkout)")
        
        //performSegue(withIdentifier: "ShowWorkoutSegue", sender: selectedWorkout)
    }
}

