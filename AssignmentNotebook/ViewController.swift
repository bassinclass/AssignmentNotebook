//
//  ViewController.swift
//  AssignmentNotebook
//
//  Created by Bob Cousy on 5/11/18.
//  Copyright © 2018 MobileMakersEdu. All rights reserved.
//

import UIKit
//Added UITableViewDelegate for Stretch #3
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
//    var assignments: [String] = ["Math","Computer Science","English"]
//    var assignments: [String] = []
    var assignments: [Assignment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        //Added for Stretch #2
        loadAssignments()
        
        //Added for Stretch #3
        tableView.delegate = self
    }
    
    //Added for Stretch #4
    override func viewWillAppear(_ animated: Bool) {
        loadAssignments()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            let currentAssignment = assignments[indexPath.row]
            cell.textLabel?.text = currentAssignment.className
            
            //Added for Stretch #3
            cell.detailTextLabel?.text = currentAssignment.assignmentName
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    //Added for Stretch #1
    @IBAction func whenAddButtonPressed(_ sender: UIBarButtonItem) {
//        let alert = UIAlertController(title: "Add New Assignment", message: nil, preferredStyle: .alert)
//        alert.addTextField { (textField) in
//            textField.placeholder = "Add class name here"
//        }
//
//        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (action) in
//            //Modified for Stretch #4
//            if let assignmentTextField = alert.textFields?[0], let assignmentName = assignmentTextField.text   {
//                self.assignments.append(assignmentName)
//                self.tableView.reloadData()
        
//                //Added for Stretch #2
//                self.saveAssignments()
//            }
//        }))
//        present(alert, animated: true, completion: nil)
        
        //Added for Stretch #4
        performSegue(withIdentifier: "addAssignmentSegue", sender: nil)
    }
    
    //Added for Stretch #2
    func saveAssignments() {
        if let encoded = try? JSONEncoder().encode(assignments){
            UserDefaults.standard.set(encoded, forKey: "Assignments")
        }
    }
    
    //Added for Stretch #2
    func loadAssignments() {
        if let objects = UserDefaults.standard.value(forKey: "Assignments") as? Data {
            //Modified for Stretch #4
            if let objectsDecoded = try? JSONDecoder().decode(Array.self, from: objects) as [Assignment] {
                assignments = objectsDecoded
            }
        }
    }
    
    //Added for Stretch #3
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
   //google how to delete a tableview cell with a swipe gesture.
    
    /************ begin gesture recognizer on line 102 **************/
    
    
    
    //Added for Stretch #4
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Modified for Stretch #5
        if segue.identifier == "addAssignmentSegue" {
            let nvc = segue.destination as! AddAssignmentViewController
            nvc.assignments = assignments
        } else {
            let nvc = segue.destination as! DetailsViewController
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                nvc.passedAssignment = assignments[selectedIndexPath.row]
            }
        }
        
        
    }
}

