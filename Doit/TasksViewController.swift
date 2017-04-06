//
//  ViewController.swift
//  Doit
//
//  Created by Nannapaneni, Vijay X [Levi, Ray & Shoup Inc Contractor for Sprint] on 3/28/17.
//  Copyright © 2017 Crap App. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = makeTask()
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗\(task.name)"
        } else{
        cell.textLabel?.text = task.name
        }
        return cell
    }
    
    
    func makeTask() -> [Task] {
        let task1 = Task()
        task1.name = "Go shopping"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy Grocery"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Plan your class"
        task3.important = false
        
        return [task1, task2, task3]
        
    }

    @IBAction func plusTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousVC = self
    }


}

