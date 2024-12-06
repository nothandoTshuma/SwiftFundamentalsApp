//
//  TodoItem.swift
//  iOS-Training-App
//
//  Created by user on 26/11/2024.
//

import SwiftUI
import SwiftData


struct TodoItemView: View {
    @Binding var tasks: [TodoItemModel]  // Binding to update the tasks array in the parent view
    let task: TodoItemModel
    var onCheckedChange: () -> Void
    var onDelete: () -> Void
    
    var body: some View {
        HStack {
            CheckboxView(isSelected: task.isSelected)
                .onTapGesture {
                    onCheckedChange()
                }
            
            Text(task.todoText)
                .font(.system(size: 18))
                .lineLimit(1)
                .padding(.leading, 8)
            
            Spacer()
            Button(action: {
                onDelete()
            }) {
                Image(systemName: "trash")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.red)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
    }
}

struct CheckboxView: View {
    var isSelected: Bool
    
    var body: some View {
        Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundColor(isSelected ? .blue : .gray)
    }
}



#Preview {
    @Previewable @State var tasks: [TodoItemModel] = []
    TodoItemView(
        tasks: $tasks,
        task: TodoItemModel(isSelected: true, todoText: "Walk the dog", date: Date.now),
        onCheckedChange: {print("Checked")},
        onDelete: {print("Deleted")}
    )
}

