//
//  ItemViewModel.swift
//  Focusa
//
//  Created by Andrey Philippov on 15.05.2025.
//

import Foundation

class TaskItemViewModel: ObservableObject, Identifiable {
    
    let id: UUID
    let task: Task
    
    @Published var text: String
    @Published var time: Int
    
    init(task: Task) {
        self.task = task
        self.id = task.id
        self.text = task.name
        self.time = task.time
    }
}

extension TaskItemViewModel {
    static var mock: TaskItemViewModel {
        TaskItemViewModel(task: Task(id: .init(), name: "Mock task", time: 60))
    }
}
