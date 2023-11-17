//
//  WorkoutInputViewController.swift
//  OverloadTracker
//
//  Created by St. Loreto on 11/9/23.
//

import UIKit

class WorkoutInputViewController: UIViewController {
    
    
    @IBOutlet weak var dayOfSplit: UITextField!
    @IBOutlet weak var workoutNameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var onComposeWorkout: ((Workout) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
// MARK: - Format for split day text field
    
  // func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
  //     // Get the current text in the text field
  //     if let currentText = textField.text as NSString? {
  //         // Calculate the new text after the user's input
  //         let newText = currentText.replacingCharacters(in: range, with: string)

  //         // Allow only a single character and ensure it's in the allowed set
  //         return newText.count <= 1 && CharacterSet(charactersIn: "1234567").isSuperset(of: CharacterSet(charactersIn: newText))
  //     }

  //     return false
  // }
    
// MARK: -
    
    // The cancel button was tapped.
    @IBAction func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func didTapDoneButton(_ sender: Any) {
        guard let dayOfSplit = dayOfSplit.text,
              !dayOfSplit.isEmpty,
              let workoutName = workoutNameTextField.text,
              !workoutName.isEmpty
        else {
            presentAlert(title: "Error", message: "Please enter a name and day for your workout.")
            return
        }
        
        var workout: Workout
        
        guard let dayOfSplitInt = Int(dayOfSplit) else {
            presentAlert(title: "Error", message: "Invalid input for day. Please enter a valid number.")
            return
        }
        
        workout = Workout(workoutName: workoutName, dayOfSplit: dayOfSplitInt, workoutDate: datePicker.date)
        
        onComposeWorkout?(workout)
        
        dismiss(animated: true)
    }
    
    private func presentAlert(title: String, message: String) {
        // 1.
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        // 2.
        let okAction = UIAlertAction(title: "OK", style: .default)
        // 3.
        alertController.addAction(okAction)
        // 4.
        present(alertController, animated: true)
    }
}
