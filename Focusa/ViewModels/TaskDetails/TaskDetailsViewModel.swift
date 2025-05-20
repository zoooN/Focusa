//
//  TaskDetailsViewModel.swift
//  Focusa
//
//  Created by Andrey Philippov on 20.05.2025.
//

import Foundation

class TaskDetailsViewModel: ObservableObject {
    
    private let task: Task
    
    @Published var taskName: String
    
    init (task: Task) {
        self.task = task
        
        taskName = task.name
    }
}

extension TaskDetailsViewModel {
    static var mock: TaskDetailsViewModel {
        TaskDetailsViewModel(task: Task(id: .init(), name: "Mock task", time: 60))
    }
}
