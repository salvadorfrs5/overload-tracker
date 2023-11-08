//
//  ViewController.swift
//  OverloadTracker
//
//  Created by Salvador Frias on 11/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create a DateFormatter
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "EEEE, MMM d, yyyy" // Customize the date format as you prefer

                // Get the current date
                let currentDate = Date()

                // Format the date and set it to the label
                dateLabel.text = dateFormatter.string(from: currentDate)
    }


}

