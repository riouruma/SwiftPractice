//
//  TodoItemViewController.swift
//  TodoApp
//
//  Created by macneko_ayu on 2015/11/14.
//  Copyright © 2015年 macneko_ayu. All rights reserved.
//

import UIKit

class TodoItemViewController: UIViewController
{

    @IBOutlet weak var todoField: UITextField!
    var task : Todo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let taskTodo = task {
            todoField.text = taskTodo.item
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Butto Action
    @IBAction func cancel(sender: UIBarButtonItem)
    {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func save(sender: UIBarButtonItem)
    {
        if task != nil {
            editTask()
        } else {
            createTask()
        }
        navigationController!.popViewControllerAnimated(true)
    }
    
    func createTask() {
        let newTask : Todo = Todo.MR_createEntity() as Todo
        newTask.item = todoField.text
        newTask.managedObjectContext!.MR_saveToPersistentStoreAndWait()
    }
    
    func editTask() {
        task?.item = todoField.text
        task?.managedObjectContext!.MR_saveToPersistentStoreAndWait()
    }
}
