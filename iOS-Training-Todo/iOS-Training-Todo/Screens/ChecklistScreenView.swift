//
//  ChecklistScreen.swift
//  iOS-Training-Todo
//
//  Created by user on 26/11/2024.
//
import SwiftUI
import SwiftData

struct ChecklistScreenView: View {
    
    @State private var tasks: [TodoItemModel] = [] // @State to track tasks
    @State private var showCreateTaskView = false
    @State private var showGrowTreeView = false
    
    private func loadTasks() {
        tasks = DatabaseManager.shared.fetchTasks()
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                if tasks.isEmpty {
                    VStack {
                        Text("No tasks yet. Click the button below to create a new task.")
                            .padding(50)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(tasks.indices, id: \.self) { index in
                            TodoItemView(
                                tasks: $tasks,
                                task: tasks[index],
                                onCheckedChange: {
                                    tasks[index].isSelected.toggle()
                                },
                                onDelete: {
                                    removeTask(index: index)
                                }
                            )
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
                Spacer()
                
                VStack{
                    NavigationLink(
                        destination: GrowYourTreeView(),
                        isActive: $showGrowTreeView
                    ) {
                        Button(action: {
                            showGrowTreeView = true
                        }) {
                            Text("Check on your tree")
                                .padding(20)
                                .foregroundColor(.green)
                        }
                    }
                    
                    NavigationLink(
                        destination: CreateANewTaskView(tasks: $tasks),
                        isActive: $showCreateTaskView
                    ) {
                        Button(action: {
                            showCreateTaskView = true
                        }) {
                            Text("Create a New Task")
                                .frame(maxWidth: .infinity)
                                .padding(20)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(26)
                        .background(Color(UIColor.systemBackground)) // Prevent scroll overlap
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom) // Ensures button aligns with screen bottom
            .navigationTitle("Your To-do List")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear() {
                loadTasks()
            }
        }
    }
}

#Preview {

    ChecklistScreenView()
}

