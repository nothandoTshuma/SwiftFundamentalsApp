//
//  apFunctions.swift
//  iOS-Training-Todo
//
//  Created by user on 27/11/2024.
//
import SwiftUI
import SwiftData

var tasks: [TodoItemModel] = []

func addItemsToList(task: TodoItemModel? = nil) -> [TodoItemModel] {
    
    // Safely unwrap the optional task and append it if not nil
    if let task = task {
        tasks.append(task)
    }
    
    return tasks
}

func removeTask(index: Int) {
    let task = tasks[index]
    DatabaseManager.shared.deleteTask(id: task.id)
    tasks.remove(at: index) // Remove from the local list as well
}
