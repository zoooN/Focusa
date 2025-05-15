//
//  MainViewModel.swift
//  Focusa
//
//  Created by Andrey Philippov on 14.05.2025.
//
import Foundation

class TaskListViewModel: ObservableObject {
    
    @Published var taskItems: [TaskItemViewModel] = []
    @Published var isEmpty: Bool = true

    func addNewTask(name: String){
        let taskId = taskItems.count
        let task = Task(id: taskId, name: name)
        
        taskItems.append(TaskItemViewModel(task: task))
    }
}
