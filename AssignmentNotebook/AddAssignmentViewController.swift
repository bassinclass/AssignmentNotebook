//
//  PickertViewController.swift
//  AssignmentNotebook
//
//  Created by Bob Cousy on 5/11/18.
//  Copyright © 2018 MobileMakersEdu. All rights reserved.
//

import UIKit

//Added for Stretch #4
class AddAssignmentViewController: UIViewController {
    
    @IBOutlet weak var classTextfield: UITextField!
    @IBOutlet weak var assignmentTextfield: UITextField!
    @IBOutlet weak var dueDateTextfield: UITextField!
    
    //Added for Stretch #6
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var assignments: [Assignment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Modified for Stretch #6
        if let className = classTextfield.text, let assignment = assignmentTextfield.text {
            let newAssignment = Assignment(assignmentName: assignment, className: className, dueDate: datePicker.date)
            assignments.append(newAssignment)
            
            //Added for Stretch #7
            sortAssignments()
            
            saveAssignments()
        }
    }
    
    func saveAssignments() {
        if let encoded = try? JSONEncoder().encode(assignments){
            UserDefaults.standard.set(encoded, forKey: "Assignments")
        }
    }
    
    //Added for Stretch #7
    func sortAssignments() {
        assignments = assignments.sorted(by: { $0.dueDate < $1.dueDate })
    }
}
