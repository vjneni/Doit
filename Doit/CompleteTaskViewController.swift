//
//  CompleteTaskViewController.swift
//  Doit
//
//  Created by Nannapaneni, Vijay X [Levi, Ray & Shoup Inc Contractor for Sprint] on 4/6/17.
//  Copyright © 2017 Crap App. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    
    var task : Task? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _ = task?.important {
            if let name = task?.name {
                taskLabel.text = "❗\(name)"
            }
        } else {
            if let name = task?.name {
              taskLabel.text = name
            }
        }
    }

    @IBAction func completeTapped(_ sender: AnyObject) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if let compTask = task{
        context.delete(compTask)
        }
        navigationController!.popViewController(animated: true)
    }

}
