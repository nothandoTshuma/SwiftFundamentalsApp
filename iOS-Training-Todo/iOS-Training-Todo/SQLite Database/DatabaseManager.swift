import SQLite3
import Foundation

class DatabaseManager {
    
    private var db: OpaquePointer?
    private let dbPath: String
    private let tableName = "tasks"
    
    // Singleton instance
    static let shared = DatabaseManager()
    
    // Initialize with the database path
    private init() {
        // Set the path to the SQLite database file
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        dbPath = documentDirectory.appendingPathComponent("tasks.sqlite").path
        
        openDatabase()
        createTable()
    }
    
    // Open database connection
    private func openDatabase() {
        if sqlite3_open(dbPath, &db) != SQLITE_OK {
            print("Unable to open database.")
        } else {
            print("Database opened successfully.")
        }
    }
    
    // Create the tasks table
    private func createTable() {
        let createTableQuery = """
        CREATE TABLE IF NOT EXISTS \(tableName) (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            todoText TEXT,
            isSelected INTEGER,
            date TEXT
        );
        """
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK {
            print("Failed to create table.")
        } else {
            print("Table created successfully.")
        }
    }
    
    func insertTask(todoText: String, isSelected: Bool, date: Date) {
        // Check if the todoText is empty before inserting
        if todoText.isEmpty {
            print("Warning: Attempting to insert an empty todoText")
            return  // Don't insert empty todoText
        }
        
        // Convert the Date to ISO8601 string
        let dateFormatter = ISO8601DateFormatter()
        let dateString = dateFormatter.string(from: date)
        
        let insertQuery = "INSERT INTO \(tableName) (todoText, isSelected, date) VALUES (?, ?, ?);"
        
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, todoText, -1, nil)
            sqlite3_bind_int(statement, 2, isSelected ? 1 : 0) // Boolean as INTEGER
            sqlite3_bind_text(statement, 3, dateString, -1, nil) // Binding the date as String
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Task inserted successfully.")
                print("task: \(todoText), isSelected: \(isSelected), date: \(dateString)")
            } else {
                print("Failed to insert task.")
            }
        } else {
            print("Failed to prepare insert statement.")
        }
        
        sqlite3_finalize(statement)
    }

    
    func fetchTasks() -> [TodoItemModel] {
        var taskList = [TodoItemModel]()
        let query = "SELECT id, todoText, isSelected, date FROM \(tableName);"
        
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let id = sqlite3_column_int64(statement, 0)
                
                // Fetch and validate todoText
                guard let todoTextPointer = sqlite3_column_text(statement, 1) else {
                    print("Warning: todoText is nil for task with id \(id)")
                    continue
                }
                let todoText = String(cString: todoTextPointer)
                
                // Fetch isSelected as boolean
                let isSelected = sqlite3_column_int(statement, 2) != 0
                
                // Fetch and validate date
                guard let datePointer = sqlite3_column_text(statement, 3) else {
                    print("Warning: date is nil for task with id \(id)")
                    continue
                }
                let dateString = String(cString: datePointer)
                let dateFormatter = ISO8601DateFormatter()
                let date = dateFormatter.date(from: dateString) ?? Date()
                
                // Create TodoItemModel and add to the list
                let todoItem = TodoItemModel(id: id, isSelected: isSelected, todoText: todoText, date: date)
                taskList.append(todoItem)
                
                // Debugging: Print fetched task
                print("Fetched task - ID: \(id), todoText: \(todoText), isSelected: \(isSelected), date: \(dateString)")
            }
        } else {
            print("Failed to fetch tasks.")
        }
        
        sqlite3_finalize(statement)
        return taskList
    }





    
    // Delete a task from the database
    func deleteTask(id: Int64) {
        let deleteQuery = "DELETE FROM \(tableName) WHERE id = ?;"
        
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, deleteQuery, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_int64(statement, 1, id)
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Task deleted successfully.")
            } else {
                print("Failed to delete task.")
            }
        } else {
            print("Failed to prepare delete statement.")
        }
        
        sqlite3_finalize(statement)
    }
    
    // Close the database connection
    func closeDatabase() {
        sqlite3_close(db)
        print("Database closed.")
    }
}
