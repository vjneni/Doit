//
//  CreateTaskViewController.swift
//  Doit
//
//  Created by Nannapaneni, Vijay X [Levi, Ray & Shoup Inc Contractor for Sprint] on 4/4/17.
//  Copyright © 2017 Crap App. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {


    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var previousVC = TasksViewController()
    
    @IBAction func addTaskTap(_ sender: Any) {
        // Create task from outlet information
        
        let task = Task()
        if let name = taskNameTextField.text {
            task.name = name
        }
        task.important = importantSwitch.isOn
        
        // Add this task into the array of tasks in previous viewcontroller
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }

}
