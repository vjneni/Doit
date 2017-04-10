//
//  ViewController.swift
//  Doit
//
//  Created by Nannapaneni, Vijay on 3/28/17.
//  Copyright © 2017 Crap App. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            if let newtask = task.name {
                cell.textLabel?.text = "❗\(newtask)"
            }
        } else {
            if let newtask = task.name {
                cell.textLabel?.text = newtask
            }
        }
        return cell
    }
    
    
    // Goes to complete View Controller to perform comeplete task
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    
    
    // Function to make tasks for the table View
    
    @IBAction func plusTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        }
        catch{
            print("OOPS THERE IS ERROR IN FETCHING TASKS")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectTaskSegue" {
            if let nextVC = segue.destination as? CompleteTaskViewController {
                nextVC.task = sender as? Task
            }
            
        }
    }
}
