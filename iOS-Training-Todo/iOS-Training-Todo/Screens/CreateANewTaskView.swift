//
//  CreateANewTaskView.swift
//  iOS-Training-Todo
//
//  Created by user on 27/11/2024.
//

import SwiftUI
import SwiftData

struct CreateANewTaskView: View {
    @Binding var tasks: [TodoItemModel]
    
    @State var taskText: String = ""
    @State var dateSelected: Date = Date()
    @State private var isLoading: Bool = false  // Track loading state
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            TextField("Enter your task description", text: $taskText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            DatePicker("Reminder Date", selection: $dateSelected, displayedComponents: .date)
                .padding()
            
            DatePicker("Reminder Time", selection: $dateSelected, displayedComponents: .hourAndMinute)
                .padding()
                .frame(maxWidth: .infinity)
            
            Spacer()
            
            if isLoading {
                ProgressView("Your task is being saved...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .padding()
            }
            
            HStack {
                Button("Cancel") {
                    print("Cancelled")
                    dismiss()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Button("Save") {
                    // Saving the task
                    isLoading = true
                    
                    // Insert task into the database
                    DatabaseManager.shared.insertTask(todoText: taskText, isSelected: false, date: dateSelected)
                    
                    // Simulate the task-saving operation and update task list after a delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        tasks = DatabaseManager.shared.fetchTasks() // Refresh the task list
                        isLoading = false // Stop the loading indicator
                        dismiss() // Dismiss the view after task is saved
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Create a New Task")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @State var tasks: [TodoItemModel] = []
    
    CreateANewTaskView(tasks: $tasks)
}
