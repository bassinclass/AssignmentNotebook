//
//  DetailsViewController.swift
//  AssignmentNotebook
//
//  Created by Bob Cousy on 5/11/18.
//  Copyright © 2018 MobileMakersEdu. All rights reserved.
//

import UIKit

//Added for Stretch #5
class DetailsViewController: UIViewController {

    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var assignmentLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    
    var passedAssignment: Assignment!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classLabel.text = passedAssignment.className
        assignmentLabel.text = passedAssignment.assignmentName
        
        //Modified for Stretch #6
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy H:mm a"
        dueDateLabel.text = dateFormatterPrint.string(from: passedAssignment.dueDate)
    }
}
