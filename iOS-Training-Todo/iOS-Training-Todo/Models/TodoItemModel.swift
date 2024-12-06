//
//  TodoItem.swift
//  iOS-Training-App
//
//  Created by user on 26/11/2024.
//

import Foundation
import SwiftData

@Model
final class TodoItemModel {
    var id: Int64
    var isSelected: Bool
    var todoText: String
    var date: Date
    
    init(id: Int64 = 0, isSelected: Bool = false, todoText: String, date: Date) {
        self.id = id
        self.isSelected = isSelected
        self.todoText = todoText
        self.date = date
    }
}
